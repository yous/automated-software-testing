#include <cstdio>
#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
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

// A Rewriter helps us manage the code rewriting task.
static Rewriter TheRewriter;

class MyASTVisitor : public RecursiveASTVisitor<MyASTVisitor>
{
public:
    MyASTVisitor() {
        BranchId = 0;
        BranchCount = 0;
        isFirstFunctionDecl = true;
    }

    bool VisitStmt(Stmt *s) {
        SourceManager &sourceMgr = TheCompInst.getSourceManager();
        Expr *cond = NULL;

        if (isa<DoStmt>(s)) {
            DoStmt *doStmt = cast<DoStmt>(s);
            BranchCount += 2;
            cond = doStmt->getCond();
            pushCondition(cond);
        } else if (isa<ForStmt>(s)) {
            ForStmt *forStmt = cast<ForStmt>(s);
            BranchCount += 2;
            cond = forStmt->getCond();
            pushCondition(cond);
        } else if (isa<IfStmt>(s)) {
            IfStmt *ifStmt = cast<IfStmt>(s);
            BranchCount += 2;
            cond = ifStmt->getCond();
            pushCondition(cond);
        } else if (isa<SwitchStmt>(s)) {
            SwitchStmt *switchStmt = cast<SwitchStmt>(s);
            SwitchCase *switchCaseList = switchStmt->getSwitchCaseList();
            while (switchCaseList != NULL) {
                if (isa<DefaultStmt>(switchCaseList)) {
                    return true;
                }
                switchCaseList = switchCaseList->getNextSwitchCase();
            }
            BranchCount += 1;
            ConditionExprs.push_back(string("\\\"default\\\""));
        } else if (isa<CaseStmt>(s)) {
            CaseStmt *caseStmt = cast<CaseStmt>(s);
            BranchCount += 1;

            ConditionExprs.push_back(EscapeString(
                        TheRewriter.ConvertToString(caseStmt->getLHS())));
        } else if (isa<DefaultStmt>(s)) {
            DefaultStmt *defaultStmt = cast<DefaultStmt>(s);
            BranchCount += 1;

            ConditionExprs.push_back(string("\\\"default\\\""));
        } else if (isa<WhileStmt>(s)) {
            WhileStmt *whileStmt = cast<WhileStmt>(s);
            BranchCount += 2;
            cond = whileStmt->getCond();
            pushCondition(cond);
        } else if (isa<AbstractConditionalOperator>(s)) {
            if (isInEnumDecl) {
                return true;
            }
            AbstractConditionalOperator *condOp =
                cast<AbstractConditionalOperator>(s);
            BranchCount += 2;
            cond = condOp->getCond();
            pushCondition(cond);
        } else {
            return true;
        }

        SourceLocation startLocation = s->getLocStart();
        while (startLocation.isMacroID()) {
            startLocation = sourceMgr.getImmediateMacroCallerLoc(startLocation);
        }
        unsigned int line = sourceMgr.getExpansionLineNumber(startLocation);
        BranchLines.push_back(line);
        BranchId++;

        return true;
    }

    bool VisitFunctionDecl(FunctionDecl *f) {
        if (!f->isExternC() && isFirstFunctionDecl) {
            isFirstFunctionDecl = false;
            FirstFunctionDeclLocation = f->getSourceRange().getBegin();
        }
        if (f->isMain()) {
            Stmt *firstChild = *f->getBody()->child_begin();
            SourceLocation start = firstChild->getLocStart();
            TheRewriter.InsertTextAfter(start,
                    "kcov_init();\n"
                    "atexit(kcov_save);\n");
        }

        return true;
    }

    void InsertInitialization(string filename) {
        string baseFilename = string(basename(filename.c_str()));
        string newFilename = baseFilename.substr(0,
                baseFilename.find_last_of(".")) + string("-cov-measure.txt");

        stringstream sstm;
        sstm << "#define KCOV_BIDS " << BranchId << endl;
        sstm << "static unsigned int kcov_branches = ";
        sstm << BranchCount << ";" << endl;
        sstm << "static unsigned int kcov_lines[KCOV_BIDS] = {" << endl;
        for (vector<unsigned int>::iterator it = BranchLines.begin();
                it != BranchLines.end(); ++it) {
            sstm << *it << ", ";
        }
        sstm << "};" << endl;
        sstm << "static unsigned int kcov_counts[KCOV_BIDS];" << endl;
        sstm << "static unsigned int kcov_thens[KCOV_BIDS];" << endl;
        sstm << "static char *kcov_exprs[KCOV_BIDS] = {" << endl;
        for (vector<string>::iterator it = ConditionExprs.begin();
                it != ConditionExprs.end(); ++it) {
            sstm << "\"" << *it << "\"," << endl;
        }
        sstm << "};" << endl;

        sstm << "static void kcov_init() {" << endl;
        sstm << " FILE *f;" << endl;
        sstm << " char *buf;" << endl;
        sstm << " unsigned int bid = 0;" << endl;
        sstm << " unsigned int line, then, els;" << endl;
        sstm << " if (f = fopen(\"" << newFilename << "\", \"r\")) {" << endl;
        sstm << "  buf = malloc(1024);" << endl;
        sstm << "  fgets(buf, 1024, f);" << endl;
        sstm << "  fgets(buf, 1024, f);" << endl;
        sstm << "  while (fgets(buf, 1024, f)) {" << endl;
        sstm << "   if (*buf < 0x30 || *buf > 0x39) {" << endl;
        sstm << "    break;" << endl;
        sstm << "   }" << endl;
        sstm << "   sscanf(buf, \"%u %u %u\", &line, &then, &els);" << endl;
        sstm << "   kcov_counts[bid] = then + els;" << endl;
        sstm << "   kcov_thens[bid] = then;" << endl;
        sstm << "   bid++;" << endl;
        sstm << "  }" << endl;
        sstm << "  fclose(f);" << endl;
        sstm << "  free(buf);" << endl;
        sstm << " }" << endl;
        sstm << "}" << endl;

        sstm << "static void kcov_save() {" << endl;
        sstm << " FILE *f;" << endl;
        sstm << " if (f = fopen(\"" << newFilename << "\", \"w\")) {" << endl;
        sstm << "  unsigned int i;" << endl;
        sstm << "  unsigned int taken_branches = 0;" << endl;
        sstm << "  fputs(\"Line#\\t| # of execution\\t| # of execution\\t"
            "| conditional\\n\", f);" << endl;
        sstm << "  fputs(\"\\t| of then branch\\t| of else branch\\t"
            "| expression\\n\", f);" << endl;
        sstm << "  for (i = 0; i < KCOV_BIDS; i++) {" << endl;
        sstm << "   fprintf(f," << endl;
        sstm << "    \"%u\\t  %u\\t\\t\\t  %u\\t\\t\\t  %s\\n\"," << endl;
        sstm << "    kcov_lines[i], kcov_thens[i]," << endl;
        sstm << "    kcov_counts[i] - kcov_thens[i], kcov_exprs[i]);" << endl;
        sstm << "   if (kcov_thens[i] > 0) {" << endl;
        sstm << "    taken_branches++;" << endl;
        sstm << "   }" << endl;
        sstm << "   if (kcov_counts[i] - kcov_thens[i] > 0) {" << endl;
        sstm << "    taken_branches++;" << endl;
        sstm << "   }" << endl;
        sstm << "  }" << endl;
        sstm << "  fprintf(f," << endl;
        sstm << "   \"Covered: %u / Total: %u = %f%%\\n\"," << endl;
        sstm << "   taken_branches, kcov_branches," << endl;
        sstm << "   100.0 * taken_branches / kcov_branches);" << endl;
        sstm << "  fclose(f);" << endl;
        sstm << " }" << endl;
        sstm << "}" << endl;

        sstm << "static int kcov_count(int bid) {" << endl;
        sstm << " kcov_counts[bid]++;" << endl;
        sstm << " return 0;" << endl;
        sstm << "}" << endl;

        sstm << "static int kcov_then(int bid) {" << endl;
        sstm << " kcov_thens[bid]++;" << endl;
        sstm << " return 1;" << endl;
        sstm << "}" << endl;

        TheRewriter.InsertTextAfter(FirstFunctionDeclLocation, sstm.str());
    }

private:
    unsigned int BranchId;
    unsigned int BranchCount;
    bool isFirstFunctionDecl;
    SourceLocation FirstFunctionDeclLocation;
    vector<unsigned int> BranchLines;
    vector<string> ConditionExprs;

    string EscapeString(string str) {
        ReplaceStringInPlace(str, string("\\"), string("\\\\"));
        ReplaceStringInPlace(str, string("\""), string("\\\""));
        return str;
    }

    void ReplaceStringInPlace(string& str, const string& from,
            const string& to) {
        size_t pos = 0;
        while ((pos = str.find(from, pos)) != string::npos) {
            str.replace(pos, from.length(), to);
            pos += to.length();
        }
    }

    void pushCondition(Expr *cond) {
        if (cond == NULL) {
            ConditionExprs.push_back(string(""));
        } else {
            ConditionExprs.push_back(
                    EscapeString(TheRewriter.ConvertToString(cond)));
        }
    }
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

    MyASTVisitor getASTVisitor() {
        return Visitor;
    }

private:
    MyASTVisitor Visitor;
};


int main(int argc, char *argv[])
{
    if (argc != 2) {
        llvm::errs() << "Usage: kcov <filename>\n";
        return 1;
    }

    // Diagnostics manage problems and issues in compile
    TheCompInst.createDiagnostics(NULL, false);

    // Set target platform options
    // Initialize target info with the default triple for our platform.
    TargetOptions *TO = new TargetOptions();
    TO->Triple = llvm::sys::getDefaultTargetTriple();
    TargetInfo *TI = TargetInfo::CreateTargetInfo(
            TheCompInst.getDiagnostics(), TO);
    TheCompInst.setTarget(TI);

    // FileManager supports for file system lookup, file system caching,
    // and directory search management.
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
    llvm::IntrusiveRefCntPtr<clang::HeaderSearchOptions> hso(
            new HeaderSearchOptions());
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


    TheRewriter.setSourceMgr(SourceMgr, TheCompInst.getLangOpts());

    // Set the main file handled by the source manager to the input file.
    const FileEntry *FileIn = FileMgr.getFile(argv[1]);
    SourceMgr.createMainFileID(FileIn);

    // Inform Diagnostics that processing of a source file is beginning.
    TheCompInst.getDiagnosticClient().BeginSourceFile(
            TheCompInst.getLangOpts(), &TheCompInst.getPreprocessor());

    // Create an AST consumer instance which is going to get called by ParseAST.
    MyASTConsumer TheConsumer;

    // Parse the file to AST, registering our consumer as the AST consumer.
    ParseAST(TheCompInst.getPreprocessor(), &TheConsumer,
            TheCompInst.getASTContext());

    string filename = string(FileIn->getName());
    TheConsumer.getASTVisitor().InsertInitialization(filename);

    string newFilename = filename.substr(0, filename.find_last_of("."))
        + string("-cov.c");
    ofstream output(newFilename.c_str());

    const RewriteBuffer *RewriteBuf = TheRewriter.getRewriteBufferFor(
            SourceMgr.getMainFileID());
    output << string(RewriteBuf->begin(), RewriteBuf->end());
    output.close();

    return 0;
}
