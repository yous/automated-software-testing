#include <cstdio>
#include <string>
#include <iostream>
#include <sstream>
#include <map>
#include <utility>

#include "clang/AST/ASTConsumer.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Basic/Diagnostic.h"
#include "clang/Basic/FileManager.h"
#include "clang/Basic/SourceManager.h"
#include "clang/Basic/TargetOptions.h"
#include "clang/Basic/TargetInfo.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Lex/Preprocessor.h"
#include "clang/Parse/ParseAST.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include "clang/Rewrite/Frontend/Rewriters.h"
#include "llvm/Support/Host.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/IntrusiveRefCntPtr.h"
#include "clang/Lex/HeaderSearch.h"
#include "clang/Frontend/Utils.h"

using namespace clang;
using namespace std;

// CompilerInstance will hold the instance of the Clang compiler for us,
// managing the various objects needed to run the compiler.
static CompilerInstance TheCompInst;

class MyASTVisitor : public RecursiveASTVisitor<MyASTVisitor>
{
public:
    MyASTVisitor() {
        BranchId = 0;
    }

    bool VisitStmt(Stmt *s) {
        SourceManager &sourceMgr = TheCompInst.getSourceManager();

        if (isa<DoStmt>(s)) {
            cout << "\tDo";
        } else if (isa<ForStmt>(s)) {
            cout << "\tFor";
        } else if (isa<IfStmt>(s)) {
            cout << "\tIf";
        } else if (isa<SwitchStmt>(s)) {
            SwitchStmt *switchStmt = cast<SwitchStmt>(s);
            SwitchCase *switchCaseList = switchStmt->getSwitchCaseList();
            while (switchCaseList != NULL) {
                if (isa<DefaultStmt>(switchCaseList)) {
                    return true;
                }
                switchCaseList = switchCaseList->getNextSwitchCase();
            }
            cout << "\tImpDef.";
        } else if (isa<CaseStmt>(s)) {
            cout << "\tCase";
        } else if (isa<DefaultStmt>(s)) {
            cout << "\tDefault";
        } else if (isa<WhileStmt>(s)) {
            cout << "\tWhile";
        } else if (isa<AbstractConditionalOperator>(s)) {
            cout << "\t?:";
        } else {
            return true;
        }

        SourceLocation startLocation = s->getLocStart();
        if (startLocation.isMacroID()) {
            startLocation = sourceMgr.getImmediateMacroCallerLoc(startLocation);
        }
        unsigned int line = sourceMgr.getExpansionLineNumber(startLocation);
        unsigned int col = sourceMgr.getExpansionColumnNumber(startLocation);
        string filename = sourceMgr.getFilename(startLocation).str();

        cout << "\tID: " << BranchId++ << "\tLine: " << line
            << "\t\tCol: " << col << "\t\tFilename: " << filename << endl;

        return true;
    }

    bool VisitFunctionDecl(FunctionDecl *f) {
        if (f->hasBody()) {
            cout << "function: " << f->getName().str() << endl;
        }
        return true;
    }

private:
    unsigned int BranchId;
};

class MyASTConsumer : public ASTConsumer
{
public:
    MyASTConsumer()
        : Visitor() //initialize MyASTVisitor
    {}

    virtual bool HandleTopLevelDecl(DeclGroupRef DR) {
        for (DeclGroupRef::iterator b = DR.begin(), e = DR.end(); b != e; ++b) {
            // Travel each function declaration using MyASTVisitor
            Visitor.TraverseDecl(*b);
        }
        return true;
    }

private:
    MyASTVisitor Visitor;
};


int main(int argc, char *argv[])
{
    if (argc != 2) {
        llvm::errs() << "Usage: kcov-branch-identify <filename>\n";
        return 1;
    }

    // Diagnostics manage problems and issues in compile
    TheCompInst.createDiagnostics(NULL, false);

    // Set target platform options
    // Initialize target info with the default triple for our platform.
    TargetOptions *TO = new TargetOptions();
    TO->Triple = llvm::sys::getDefaultTargetTriple();
    TargetInfo *TI = TargetInfo::CreateTargetInfo(TheCompInst.getDiagnostics(), TO);
    TheCompInst.setTarget(TI);

    // FileManager supports for file system lookup, file system caching, and directory search management.
    TheCompInst.createFileManager();
    FileManager &FileMgr = TheCompInst.getFileManager();

    // SourceManager handles loading and caching of source files into memory.
    TheCompInst.createSourceManager(FileMgr);
    SourceManager &SourceMgr = TheCompInst.getSourceManager();

    // Prreprocessor runs within a single source file
    TheCompInst.createPreprocessor();

    // ASTContext holds long-lived AST nodes (such as types and decls) .
    TheCompInst.createASTContext();

    // Enable HeaderSearch option
    llvm::IntrusiveRefCntPtr<clang::HeaderSearchOptions> hso( new HeaderSearchOptions());
    HeaderSearch headerSearch(hso,
                              TheCompInst.getFileManager(),
                              TheCompInst.getDiagnostics(),
                              TheCompInst.getLangOpts(),
                              TI);

    // <Warning!!> -- Platform Specific Code lives here
    // This depends on A) that you're running linux and
    // B) that you have the same GCC LIBs installed that I do.
    /*
    $ gcc -xc -E -v -
    ..
     /usr/local/include
     /usr/lib/gcc/x86_64-linux-gnu/4.4.5/include
     /usr/lib/gcc/x86_64-linux-gnu/4.4.5/include-fixed
     /usr/include
    End of search list.
    */
    const char *include_paths[] = {"/usr/local/include",
                "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/include",
                "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/include-fixed",
                "/usr/include"};

    for (int i=0; i<4; i++)
        hso->AddPath(include_paths[i],
                    clang::frontend::Angled,
                    false,
                    false);
    // </Warning!!> -- End of Platform Specific Code

    InitializePreprocessor(TheCompInst.getPreprocessor(),
                  TheCompInst.getPreprocessorOpts(),
                  *hso,
                  TheCompInst.getFrontendOpts());


    // A Rewriter helps us manage the code rewriting task.
    Rewriter TheRewriter;
    TheRewriter.setSourceMgr(SourceMgr, TheCompInst.getLangOpts());

    // Set the main file handled by the source manager to the input file.
    const FileEntry *FileIn = FileMgr.getFile(argv[1]);
    SourceMgr.createMainFileID(FileIn);

    // Inform Diagnostics that processing of a source file is beginning.
    TheCompInst.getDiagnosticClient().BeginSourceFile(TheCompInst.getLangOpts(),&TheCompInst.getPreprocessor());

    // Create an AST consumer instance which is going to get called by ParseAST.
    MyASTConsumer TheConsumer;

    // Parse the file to AST, registering our consumer as the AST consumer.
    ParseAST(TheCompInst.getPreprocessor(), &TheConsumer, TheCompInst.getASTContext());

    return 0;
}
