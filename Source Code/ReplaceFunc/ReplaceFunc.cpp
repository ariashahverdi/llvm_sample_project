//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "ReplaceFunc"
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/IR/Instructions.h"

#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/StringExtras.h"

#include "llvm/IR/CallingConv.h"
#include "llvm/IR/Constant.h"

/////////////////

using namespace llvm;

namespace {
    struct ReplaceFunc :  public ModulePass
    {
        
        /** Constructor. */
        static char ID;
        ReplaceFunc() : ModulePass(ID) {}
        
        //DEFINE_INTPASS_ANALYSIS_ADJUSTMENT(PointerAnalysisPass);
        
        /**
         * @brief Runs this pass on the given function.
         * @param [in,out] func The function to analyze
         * @return true if the function was modified; false otherwise
         */
        virtual bool runOnModule(Module &M){
            for (Module::iterator F = M.begin(), E = M.end(); F != E; ++F){
                if (F->isDeclaration()) continue; //Probably will never happen
                for (Function::iterator BB = F->begin(), E = F->end(); BB != E; ++BB) {
                    for (BasicBlock::iterator I = BB->begin(), e = BB->end(); I != e; ++I) {
                        if (CallInst* CI = dyn_cast<CallInst>(&*I)) {
                            //errs() << *I << "\n";
                            int flag = 0;
                            for (unsigned op = 0, opc = CI->getNumArgOperands(); op!= opc; ++op) {
                                Value *Tmp = CI->getArgOperand(op);
                                if (isa<Constant>(Tmp)){
                                    //errs() << Tmp << "\n";
                                    flag = 1;
                                    break;
                                }
                            }
                            if(flag){
                                Function *My_Func = CI->getCalledFunction();
                                if (My_Func->isDeclaration()){break;}
                                ValueToValueMapTy VMap;
                                Function* duplicateFunction = CloneFunction(My_Func, VMap,/*ModuleLevelChanges=*/false);
                                duplicateFunction->setLinkage(GlobalValue::InternalLinkage);
                                My_Func->getParent()->getFunctionList().push_back(duplicateFunction);
                                CI->setCalledFunction(duplicateFunction);
                                Function::arg_iterator AI = duplicateFunction->arg_begin();
                                //errs() << *CI << "\n";
                                for (unsigned op = 0, opc = CI->getNumArgOperands(); op!= opc; ++op) {
                                    Value* my_val = CI->getArgOperand(op);
                                    if (isa<Constant>(my_val)){
                                        AI->replaceAllUsesWith(my_val);
                                        //errs() << *AI << "\n";
                                        //errs() << *my_val << "\n";
                                    }
                                    AI++;
                                }
                            }//if(flag)
                        }// end CallInst
                    }
                }
            }
            return true;
        }
    };
}

char ReplaceFunc::ID = 0;
static RegisterPass<ReplaceFunc> X("replace-function", "Aria's Replace Function Pass", false, false);