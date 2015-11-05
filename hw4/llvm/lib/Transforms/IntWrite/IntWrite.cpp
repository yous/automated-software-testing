#define DEBUG_TYPE "IntWrite"

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

using namespace llvm;
using namespace std;

namespace {
  struct IntWrite: public FunctionPass {
    static char ID; // Pass identification, replacement for typeid

		IntWrite() : FunctionPass(ID) {}

		Type *intTy, *ptrTy, *voidTy, *boolTy ; // These variables are to store the type instances for primitive types.
		
		Constant * p_init ; // points to the function instance of _init_.
		Constant * p_probe ; // points to the function instance of _probe_.

		virtual bool doInitialization(Module &M) {
			/* doInitialization() is executed once per target module,
			 * and executed before any invocation of runOnFunction().
			 * This function is for initialization and the module level 
			 * instrumentation (e.g., add functions). */

			/* check if there is a function in a target program that conflicts
			 * with the probe functions */			
			if (M.getFunction(StringRef("_init_")) != NULL) {
				errs() << "Error: function _init_() already exists.\n" ;
				exit(1) ;
			}
			if (M.getFunction(StringRef("_probe_")) != NULL) {
				errs() << "Error: function _probe_() already exists.\n" ;
				exit(1) ;
			}

			/* store the type instances for primitive types */
			intTy = Type::getInt32Ty(M.getContext()) ;
			ptrTy = Type::getInt8PtrTy(M.getContext()) ;
			voidTy = Type::getVoidTy(M.getContext()) ;
			boolTy = Type::getInt1Ty(M.getContext()) ;
			voidTy = Type::getVoidTy(M.getContext()) ;

			/* add a new declaration of function _init_ which has no argument */
			FunctionType * fty = FunctionType::get(voidTy, false) ;
			p_init = M.getOrInsertFunction("_init_", fty) ;

			/* add a new declaration of function _probe_ which accept three
			 * arguments (i.e., int, char *, and int) */
			Type * args_types[3] ;
			args_types[0] = intTy ; //Type::getInt32Ty(*ctx) ;
			args_types[1] = ptrTy ; //Type::getInt8PtrTy(*ctx) ;	
			args_types[2] = intTy ; //Type::getInt32Ty(*ctx) ;	
			p_probe = M.getOrInsertFunction("_probe_", 
					FunctionType::get(voidTy, ArrayRef<Type *>(args_types), false)) ;

			/* add a function call to _init_ at the beginning of 
			 * the main function*/
			Function * mainFunc = M.getFunction(StringRef("main")) ;
			if (mainFunc != NULL) {
				IRBuilder<> builder(M.getFunction(StringRef("main"))->getEntryBlock().getFirstInsertionPt()) ;
				builder.CreateCall(p_init, Twine("")) ;
			}

			return true ;
		} // doInitialization.

		virtual bool doFinalization(Module &M) {
			/* This function is executed once per target module after
			 * all executions of runOnFunction() under the module. */

			return false ;
		} //doFinalization.

    virtual bool runOnFunction(Function &F) {
			/* This function is invoked once for every function in the target 
			 * module by LLVM */

			/* Invoke runOnBasicBlock() for each basic block under F. */
			for (Function::iterator itr = F.begin() ; itr != F.end() ; itr++) {
				runOnBasicBlock(*itr) ;
			}

      return true;
    } //runOnFunction.

		bool runOnBasicBlock (BasicBlock &B) {
			/* This function is invoked by runOnFunction() for each basic block
			 * in the function. Note that this is not invoked by LLVM and different
			 * from runOnBasicBlock() of BasicBlockPass.*/

			for (BasicBlock::iterator i = B.begin() ; i != B.end() ; i++) {
				/* for each instruction of the basic block in order */

				if (i->getOpcode() == Instruction::Store) {
					if (i->getOperand(0)->getType() == intTy) {
						StoreInst * st = dyn_cast<StoreInst>(i) ;

						/* add a function call to _probe_ right before
						 * a store instruction on an integer variable. */

						int loc = st->getDebugLoc().getLine() ; // the location of the current instruction.
						Value * var = st->getPointerOperand() ; // the target variable 
						Value * val = st->getOperand(0) ; // the value to be assigned.

						IRBuilder<> builder(i) ;
						Value * args[3] ;
						args[0] = ConstantInt::get(intTy, loc, false) ; // location of store instruction.
						args[1] = builder.CreateGlobalStringPtr(var->getName(), "") ; // create a new string constant of the variable name, and get the pointer to it.
						args[2] = val ; // the value to be assigned to the variable.
						builder.CreateCall(p_probe, args, Twine("")) ;
						continue ;
					}
				}	
			}
			return true ;
		} // runOnBasicBlock.
  };
}

/* The code in the remaining part is to register this Pass to
 * LLVM Pass Manager such that LLVM/Clang can use it. */
char IntWrite::ID = 0;

namespace llvm {
	void initializeIntWritePass(llvm::PassRegistry &) ;
}

INITIALIZE_PASS_BEGIN(IntWrite, "IntWrite", "monitor writes to integers", false, false)
INITIALIZE_PASS_END(IntWrite, "IntWrite", "monitor writes to integers", false,  false) 

static struct Register {
	Register() {
		initializeIntWritePass(*llvm::PassRegistry::getPassRegistry()) ;
	}
} X;

static void registerIntWritePass(
	const llvm::PassManagerBuilder &Builder, 
	llvm::PassManagerBase &PM) {
	PM.add(new IntWrite) ;
}

static llvm::RegisterStandardPasses 
RegisterIntWrite(llvm::PassManagerBuilder::EP_EarlyAsPossible, registerIntWritePass) ;
