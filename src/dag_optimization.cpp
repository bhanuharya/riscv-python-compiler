#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/Transforms/Scalar.h>
#include <llvm/Transforms/IPO/PassManagerBuilder.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Analysis/CFGPrinter.h>
#include <llvm/IR/CFG.h>
#include <llvm/Support/GraphWriter.h>
#include <llvm/IR/Verifier.h>

using namespace llvm;

void writeCFGToDotFile(Function &F, const std::string &Filename) {
    std::error_code EC;
    raw_fd_ostream File(Filename, EC, sys::fs::OF_Text);

    if (EC) {
        errs() << "Error opening file: " << EC.message() << "\n";
        return;
    }

    WriteGraph(File, &F);
    errs() << "CFG for function " << F.getName() << " written to " << Filename << "\n";
}

int main(int argc, char **argv) {
    // Initialize LLVM context and module
    LLVMContext Context;
    SMDiagnostic Err;
    std::unique_ptr<Module> Mod = parseIRFile("input.ll", Err, Context);

    if (!Mod) {
        Err.print(argv[0], errs());
        return 1;
    }

    // Find the function to optimize and generate CFGs
    Function *F = Mod->getFunction("_ZN8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx");
    if (!F) {
        errs() << "Function '_ZN8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx' not found in module.\n";
        return 1;
    }

    // Verify the module to ensure it's well-formed
    if (verifyModule(*Mod, &errs())) {
        errs() << "Module verification failed.\n";
        return 1;
    }

    // Print the function before optimization
    errs() << "Function before optimization:\n";
    F->print(errs());

    // Generate CFG before optimization
    writeCFGToDotFile(*F, "before_optimization_sum.dot");

    // Create a pass manager and add optimization passes
    legacy::PassManager PassMgr;
    PassManagerBuilder Builder;

    // Configure the optimization level (e.g., O2)
    Builder.OptLevel = 2;

    // Add standard optimization passes
    Builder.populateModulePassManager(PassMgr);

    // Run the optimizations on the module
    PassMgr.run(*Mod);

    // Print the function after optimization
    errs() << "Function after optimization:\n";
    F->print(errs());

    // Generate CFG after optimization
    writeCFGToDotFile(*F, "after_optimization_sum.dot");

    // Write the optimized LLVM IR to a file
    std::error_code EC;
    raw_fd_ostream Out("optimized.ll", EC, sys::fs::OF_None);

    if (EC) {
        errs() << "Error opening file for writing: " << EC.message() << "\n";
        return 1;
    }

    Mod->print(Out, nullptr);
    return 0;
}
