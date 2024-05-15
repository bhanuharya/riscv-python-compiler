
## Setup

### Install Required Libraries and Tools

1. **Install Python Packages**:
   ```sh
   pip install cython llvmlite

### Detailed Steps
1. **Compile Cython to C**
compiles the Cython code (bubble_sort.pyx) to C code (bubble_sort.c) using the provided setup.py script.

2 **Generate LLVM IR using Clang**
uses Clang to generate LLVM IR from the C code and stores it in the llvm_ir directory.

3. **Apply Various Optimizations**
runs the optimize.py script to apply various optimizations to the generated LLVM IR.

4 **Generate Native Machine Code**
uses LLVM's llc and clang to generate native machine code from the optimized LLVM IR.

5. **Run the Generated Machine Code**
runs the generated native machine code.