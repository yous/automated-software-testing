#define DEBUG_TYPE "CCov"

#include <iostream>

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

    // Fill out.

    CCov() : FunctionPass(ID) {}

    virtual bool doInitialization(Module &M) {
      /* doInitialization() is executed once per target module,
       * and executed before any invocation of runOnFunction().
       * This function is for initialization and the module level
       * instrumentation (e.g., add functions). */

      // Fill out.

      return true;
    } // doInitialization.

    virtual bool doFinalization(Module &M) {
      /* This function is executed once per target module after
       * all executions of runOnFunction() under the module. */

      // Fill out.

      return false;
    } // doFinalization.

    virtual bool runOnFunction(Function &F) {
      /* This function is invoked once for every function in the target
       * module by LLVM. */

      // Fill out.

      return true;
    } // runOnFunction.

    bool runOnBasicBlock (BasicBlock &B) {
      /* This function is invoked by runOnFunction() for each basic block
       * in the function. Note that this is not invoked by LLVM and different
       * from runOnBasicBlock() of BasicBlockPass. */

      // Fill out.

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
