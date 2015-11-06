#define DEBUG_TYPE "CCov"

#include <iostream>
#include <map>
#include <vector>

#include "llvm/DebugInfo.h"
#include "llvm/Pass.h"
#include "llvm/PassManager.h"

#include "llvm/ADT/Statistic.h"

#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/IRBuilder.h"

#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "../lib/IR/ConstantsContext.h"

/* CCov.cpp
 *
 * Currently, it is a 'blank' FunctionPass that gives no effect on the target
 * program. You can implement your own FunctionPass by writing down your own
 * code where the comment "Fill out" is.
 * */

using namespace llvm;
using namespace std;

namespace {
  struct CCov: public FunctionPass {
    static char ID; // Pass identification, replacement for typeid

    // These variables are to store the type instances for primitive types.
    Type *intTy, *intPtrTy, *voidTy;
    // Points to the function instance of _init_.
    Constant *p_init;
    // Points to the function instance of _probe_.
    Constant *p_probe;
    // Holds index information for each line.
    map<int, int> map_lines;
    // Holds lines.
    vector<int> lines;
    // Holds indices.
    vector<int> indices;
    // Holds whether it's switch or not.
    vector<bool> switches;

    CCov() : FunctionPass(ID) {}

    virtual bool doInitialization(Module &M) {
      /* doInitialization() is executed once per target module,
       * and executed before any invocation of runOnFunction().
       * This function is for initialization and the module level
       * instrumentation (e.g., add functions). */

      /* Check if there is a function in a target program that conflicts with
       * the probe functions. */
      if (M.getFunction(StringRef("_init_")) != NULL) {
        errs() << "Error: function _init_() already exists.\n";
        exit(1);
      }
      if (M.getFunction(StringRef("_probe_")) != NULL) {
        errs() << "Error: function _probe_() already exists.\n";
        exit(1);
      }

      /* Store the type instances for primitive types. */
      intTy = Type::getInt32Ty(M.getContext());
      intPtrTy = Type::getInt32PtrTy(M.getContext());
      voidTy = Type::getVoidTy(M.getContext());

      /* Add a new declaration of function _init_ which accept three arguments
       * (i.e., int, char **, and int *). */
      Type *initArgs[4];
      initArgs[0] = intTy;
      initArgs[1] = intPtrTy;
      initArgs[2] = intPtrTy;
      initArgs[3] = intPtrTy;
      FunctionType *initFty = FunctionType::get(
          voidTy, ArrayRef<Type *>(initArgs), false);
      p_init = M.getOrInsertFunction("_init_", initFty);

      /* Add a new declaration of function _probe_ which accept two arguments
       * (i.e., int, and int). */
      Type *probeArgs[2];
      probeArgs[0] = intTy;
      probeArgs[1] = intTy;
      FunctionType *probeFty = FunctionType::get(
          voidTy, ArrayRef<Type *>(probeArgs), false);
      p_probe = M.getOrInsertFunction("_probe_", probeFty);

      return true;
    } // doInitialization.

    virtual bool doFinalization(Module &M) {
      /* This function is executed once per target module after
       * all executions of runOnFunction() under the module. */

      /* Add a function call to _init_ at the beginning of the main function. */
      Function *mainFunc = M.getFunction(StringRef("main"));
      if (mainFunc != NULL) {
        IRBuilder<> builder(M.getFunction(StringRef("main"))
            ->getEntryBlock().getFirstInsertionPt());

        vector<Value *> initArgs;
        initArgs.push_back(ConstantInt::get(intTy, lines.size()));

        vector<Constant *> linesVec;
        for (size_t i = 0; i < lines.size(); i++) {
          linesVec.push_back(ConstantInt::get(intTy, lines[i]));
        }
        Constant *linesArr = ConstantArray::get(
            ArrayType::get(intTy, lines.size()), linesVec);
        GlobalVariable *linesGlob = new GlobalVariable(
            M, ArrayType::get(intTy, lines.size()), false,
            GlobalValue::PrivateLinkage, linesArr);
        initArgs.push_back(builder.CreateBitCast(linesGlob, intPtrTy));

        vector<Constant *> indicesVec;
        for (size_t i = 0; i < indices.size(); i++) {
          indicesVec.push_back(ConstantInt::get(intTy, indices[i]));
        }
        Constant *indicesArr = ConstantArray::get(
            ArrayType::get(intTy, indices.size()), indicesVec);
        GlobalVariable *indicesGlob = new GlobalVariable(
            M, ArrayType::get(intTy, indices.size()), false,
            GlobalValue::PrivateLinkage, indicesArr);
        initArgs.push_back(builder.CreateBitCast(indicesGlob, intPtrTy));

        vector<Constant *> switchesVec;
        for (size_t i = 0; i < switches.size(); i++) {
          switchesVec.push_back(ConstantInt::get(intTy, switches[i]));
        }
        Constant *switchesArr = ConstantArray::get(
            ArrayType::get(intTy, switches.size()), switchesVec);
        GlobalVariable *switchesGlob = new GlobalVariable(
            M, ArrayType::get(intTy, switches.size()), false,
            GlobalValue::PrivateLinkage, switchesArr);
        initArgs.push_back(builder.CreateBitCast(switchesGlob, intPtrTy));

        builder.CreateCall(p_init, initArgs);
      }

      return false;
    } // doFinalization.

    virtual bool runOnFunction(Function &F) {
      /* This function is invoked once for every function in the target
       * module by LLVM. */

      /* Invoke runOnBasicBlock() for each basic block under F. */
      for (Function::iterator it = F.begin(); it != F.end(); it++) {
        runOnBasicBlock(*it);
      }

      return true;
    } // runOnFunction.

    bool runOnBasicBlock (BasicBlock &B) {
      /* This function is invoked by runOnFunction() for each basic block
       * in the function. Note that this is not invoked by LLVM and different
       * from runOnBasicBlock() of BasicBlockPass. */

      map<int, int>::const_iterator map_it;

      for (BasicBlock::iterator it = B.begin(); it != B.end(); it++) {
        if (it->getOpcode() == Instruction::Br) {
          /* Br instruction. */
          BranchInst *brInst = dyn_cast<BranchInst>(it);
          if (brInst->isConditional()) {
            int line = brInst->getDebugLoc().getLine();
            int index;
            map_it = map_lines.find(line);
            if (map_it == map_lines.end()) {
              index = 0;
            } else {
              index = map_it->second + 1;
            }

            // Add meta information for the branch.
            lines.push_back(line);
            indices.push_back(index);
            switches.push_back(false);

            // Create a probe call before branch.
            CastInst *castInst = CastInst::CreateIntegerCast(
                brInst->getCondition(), intTy, false);
            Value *probeArgs[2];
            probeArgs[0] = ConstantInt::get(intTy, lines.size() - 1);
            probeArgs[1] = castInst;
            CallInst *probeCall = CallInst::Create(p_probe, probeArgs);
            B.getInstList().insert(brInst, castInst);
            B.getInstList().insert(brInst, probeCall);

            map_lines[line] = index;
          }
        } else if (it->getOpcode() == Instruction::Switch) {
          /* Switch instruction. */
          SwitchInst *switchInst = dyn_cast<SwitchInst>(it);
          int line = switchInst->getDebugLoc().getLine();
          int index;
          map_it = map_lines.find(line);
          if (map_it == map_lines.end()) {
            index = 0;
          } else {
            index = map_it->second + 1;
          }

          for (unsigned i = 1; i <= switchInst->getNumSuccessors(); i++) {
            // Add meta information for the branch.
            lines.push_back(line);
            indices.push_back(index);
            switches.push_back(true);

            BasicBlock *block;
            // Record default block at the end.
            if (i == switchInst->getNumSuccessors()) {
              // Default block.
              block = switchInst->getSuccessor(0);
            } else {
              // Case block.
              block = switchInst->getSuccessor(i);
            }
            IRBuilder<> builder(block->getFirstInsertionPt());
            Value *probeArgs[2];
            probeArgs[0] = ConstantInt::get(intTy, lines.size() - 1);
            probeArgs[1] = ConstantInt::get(intTy, 1);
            builder.CreateCall(p_probe, probeArgs);

            index++;
          }
          map_lines[line] = index - 1;
        }
      }

      return true;
    } // runOnBasicBlock.
  };
}

/* The code in the remaining part is to register this Pass to
 * LLVM Pass Manager such that LLVM/Clang can use it. */
char CCov::ID = 0;

namespace llvm {
  void initializeCCovPass(llvm::PassRegistry &);
}

INITIALIZE_PASS_BEGIN(CCov, "CCov", "monitor writes to integers", false, false)
INITIALIZE_PASS_END(CCov, "CCov", "monitor writes to integers", false,  false)

static struct Register {
  Register() {
    initializeCCovPass(*llvm::PassRegistry::getPassRegistry());
  }
} X;

static void registerCCovPass(
    const llvm::PassManagerBuilder &Builder,
    llvm::PassManagerBase &PM) {
  PM.add(new CCov);
}

static llvm::RegisterStandardPasses
RegisterCCov(llvm::PassManagerBuilder::EP_EarlyAsPossible, registerCCovPass);
