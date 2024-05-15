#!/bin/bash

# Log file
LOGFILE="setup_and_run.log"
: > "$LOGFILE" # Clear the log file at the start

# Function to run a command and print its output
run_command() {
    echo "Running command: $1" | tee -a "$LOGFILE"
    output=$(eval $1 2>&1 | tee -a "$LOGFILE")
    return $?
}

# Ensure we are in the correct directory
cd "$(dirname "$0")"

# Check if the conda environment exists
if ! conda info --envs | grep -q "riscv-compiler"; then
    echo "Creating Conda environment..." | tee -a "$LOGFILE"
    if [ -f "environment.yml" ]; then
        run_command "conda env create -f environment.yml"
    else
        echo "environment.yml not found! Exiting." | tee -a "$LOGFILE"
        exit 1
    fi
fi

# Activate the conda environment
echo "Activating Conda environment..." | tee -a "$LOGFILE"
run_command "source activate riscv-compiler"

# Step 1: Compile Cython to C
echo "Compiling Cython to C..." | tee -a "$LOGFILE"
cd src
run_command "python setup.py build_ext --inplace"
if [ ! -f "bubble_sort.c" ]; then
    echo "bubble_sort.c not generated! Exiting." | tee -a "$LOGFILE"
    exit 1
fi

# Step 2: Generate LLVM IR using Clang
echo "Generating LLVM IR..." | tee -a "$LOGFILE"
if [ -f "bubble_sort.c" ]; then
    run_command "clang -I\"$CONDA_PREFIX/include/python3.10\" -S -emit-llvm bubble_sort.c -o ../llvm_ir/bubble_sort.ll"
    if [ ! -f "../llvm_ir/bubble_sort.ll" ]; then
        echo "LLVM IR file bubble_sort.ll not generated! Exiting." | tee -a "$LOGFILE"
        exit 1
    fi
else
    echo "bubble_sort.c not found! Exiting." | tee -a "$LOGFILE"
    exit 1
fi

# Step 3: Apply various optimizations
echo "Applying optimizations..." | tee -a "$LOGFILE"
run_command "python optimize.py"
if [ ! -f "../llvm_ir/bubble_sort.ll" ]; then
    echo "Optimized LLVM IR file bubble_sort_opt.ll not generated! Exiting." | tee -a "$LOGFILE"
    exit 1
fi

# Step 4: Generate native machine code using llvmlite
echo "Generating native machine code..." | tee -a "$LOGFILE"
run_command "python generate_machine_code.py"
if [ ! -f "../machine_code/bubble_sort.o" ]; then
    echo "Object file bubble_sort.o not generated! Exiting." | tee -a "$LOGFILE"
    exit 1
fi

# Return to the main directory
cd ..

# Link the object file to create the executable
echo "Linking object file to create the executable..." | tee -a "$LOGFILE"
run_command "clang machine_code/bubble_sort.o -o machine_code/bubble_sort"
if [ ! -f "machine_code/bubble_sort" ]; then
    echo "Executable bubble_sort not generated! Exiting." | tee -a "$LOGFILE"
    exit 1
fi

# Step 5: Run the generated machine code
echo "Running the generated machine code..." | tee -a "$LOGFILE"
cd machine_code
if [ -f "bubble_sort" ]; then
    run_command "./bubble_sort"
else
    echo "Executable bubble_sort not found! Exiting." | tee -a "$LOGFILE"
    exit 1
fi
