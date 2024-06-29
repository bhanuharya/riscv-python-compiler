#include "llvm/IR/PassManager.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Local.h" // For isInstructionTriviallyDead
#include "llvm/Transforms/Utils/ValueMapper.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/Debug.h"
#include "llvm/Passes/PassBuilder.h" // Include PassBuilder
#include "llvm/IR/PassManager.h"

#include <map>
#include <vector>

using namespace llvm;

namespace {
    class CustomOptPass : public PassInfoMixin<CustomOptPass> {
    public:
        PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
            bool changed = false;

            // Common Subexpression Elimination (CSE)
            std::map<std::pair<unsigned, std::vector<Value*>>, Instruction*> exprMap;
            for (auto &BB : F) {
                for (auto it = BB.begin(); it != BB.end();) {
                    Instruction &I = *it++;
                    // Create a key from opcode and operands
                    std::vector<Value*> operands;
                    for (auto &Op : I.operands()) {
                        operands.push_back(Op);
                    }
                    auto key = std::make_pair(I.getOpcode(), operands);

                    if (exprMap.find(key) != exprMap.end()) {
                        I.replaceAllUsesWith(exprMap[key]);
                        I.eraseFromParent();
                        it = BB.begin(); // Reset iterator to ensure safe continuation
                        changed = true;
                    } else {
                        exprMap[key] = &I;
                    }
                }
            }

            // Dead Code Elimination (DCE)
            for (auto &BB : F) {
                for (auto it = BB.begin(); it != BB.end();) {
                    Instruction &I = *it++;
                    if (isInstructionTriviallyDead(&I)) {
                        I.eraseFromParent();
                        it = BB.begin(); // Reset iterator to ensure safe continuation
                        changed = true;
                    }
                }
            }

            if (changed) {
                return PreservedAnalyses::none();
            } else {
                return PreservedAnalyses::all();
            }
        }
    };
}

// Registration of the pass
llvm::PassPluginLibraryInfo getCustomOptPassPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "CustomOptPass", LLVM_VERSION_STRING,
            [](PassBuilder &PB) {
                PB.registerPipelineParsingCallback(
                    [](StringRef Name, FunctionPassManager &FPM,
                       ArrayRef<PassBuilder::PipelineElement>) {
                        if (Name == "custom-opt-pass") {
                            FPM.addPass(CustomOptPass());
                            return true;
                        }
                        return false;
                    });
            }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getCustomOptPassPluginInfo();
}
