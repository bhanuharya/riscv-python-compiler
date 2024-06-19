#!/bin/bash

# Ensure that llvm_ir directory exists
mkdir -p /home/harya/Documents/riscv-python-compiler/llvm_ir

# Path to the LLVM IR file
llvm_ir_file="/home/harya/Documents/riscv-python-compiler/llvm_ir/output_llvm_ir.ll"

# Ensure that Graphviz is installed
if ! command -v dot &> /dev/null
then
    echo "Graphviz could not be found, please install it first."
    exit
fi

# Change to the llvm_ir directory
cd /home/harya/Documents/riscv-python-compiler/llvm_ir

# Use llc to generate SelectionDAG dot files with detailed visualization options
llc -O2 -mtriple=x86_64-pc-linux-gnu -view-dag-combine1-dags -view-legalize-dags -view-dag-combine2-dags -view-isel-dags -view-sched-dags ${llvm_ir_file}

# Convert DOT files to PNG using Graphviz
for dot_file in ./*.dot; do
    if [[ -f "$dot_file" ]]; then
        dot -Tpng ${dot_file} -o "${dot_file%.dot}.png"
    else
        echo "No .dot files found. Please check if llc generated them correctly."
    fi
done

echo "SelectionDAG visualizations have been generated."
