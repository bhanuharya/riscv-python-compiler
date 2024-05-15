
### Combined Script for the Compilation Pipeline

#### `src/main_compiler.py`


import os
import subprocess

def run_command(command):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error running command: {command}")
        print(result.stderr)
    return result.stdout

def main():
    # Step 1: Compile Cython to C
    print("Compiling Cython to C...")
    run_command("python setup.py build_ext --inplace")

    # Step 2: Generate LLVM IR using Clang
    print("Generating LLVM IR...")
    run_command("clang -I\"$CONDA_PREFIX/include/python3.10\" -S -emit-llvm bubble_sort.c -o ../llvm_ir/bubble_sort.ll")

    # Step 3: Apply Various Optimizations
    print("Applying optimizations...")
    run_command("python optimize.py")

    # Step 4: Generate Native Machine Code
    print("Generating native machine code...")
    run_command("llc -filetype=obj ../llvm_ir/bubble_sort_opt.ll -o ../machine_code/bubble_sort.o")
    run_command("clang ../machine_code/bubble_sort.o -o ../machine_code/bubble_sort")

    # Step 5: Run the Generated Machine Code
    print("Running the generated machine code...")
    run_command("./machine_code/bubble_sort")

    print("Compilation pipeline completed.")

if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    main()
