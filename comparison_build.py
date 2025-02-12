import argparse
import os
import subprocess
import time

# Define paths
BUILDROOT_DIR = '/home/bhanuharya/Documents/buildroot-2024.02.10/output/images'
FILESYSTEM = f'{BUILDROOT_DIR}/rootfs.ext2'
RISCV_DIR = '/opt/riscv'
SYSROOT = f'{RISCV_DIR}/sysroot'
DEBUG_LLC = f'/home/bhanuharya/Documents/llvm-project/build/bin/llc'
CLANG_NAME = 'clang'

# Optimization help text
optimizatioms_help = r"""
    Basic optimizations:
    simplify-cfg - Simplify Control Flow Graph
    instcombine - Combine Instructions
    sroa - Scalar Replacement of Aggregates
    dce - Dead Code Elimination
    gvn - Global Value Numbering
    memcpyopt - MemCpy Optimizations
    sccp - Sparse Conditional Constant Propagation
    reassociate - Reassociate Expressions

    Loop optimizations:
    loop-simplify - Canonicalize Natural Loops
    loop-unroll - Unroll Loops
    loop-vectorize - Vectorize Loops
    licm - Loop Invariant Code Motion

    Interprocedure optimizations:
    function-attrs - Deduce Function Attributes
    inline - Function Integration/Inlining
    globalopt - Global Variable Optimizer
    argpromotion - Promote ‘by reference’ arguments to scalars

    Memory optimizations:
    dse - Dead Store Elimination
    deadargelim - Dead Argument Elimination
    mldst-motion - Reorder Memory Loads
    
    More info: https://llvm.org/docs/Passes.html
"""

# Parse command-line arguments
parser = argparse.ArgumentParser(prog='build', formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('filein', help="Python source file to compile")
parser.add_argument('--dags', action='store_true', help='Show DAG-based optimization diagrams')
parser.add_argument('--opt', '-o', nargs='+', help=optimizatioms_help, default=[])
args = parser.parse_args()

# List of allowed optimizations
allowed_passes = [
    'simplify-cfg', 'instcombine', 'sroa', 'dce', 'gvn',
    'memcpyopt', 'sccp', 'reassociate', 'loop-simplify', 'loop-unroll',
    'loop-vectorize', 'licm', 'function-attrs', 'inline', 'globalopt',
    'argpromotion', 'dse', 'deadargelim', 'mldst-motion'
]

# Validate optimization passes
pass_string = ','.join([p for p in args.opt if p in allowed_passes])
if any(p not in allowed_passes for p in args.opt):
    print(f"Unknown optimization pass(es): {[p for p in args.opt if p not in allowed_passes]}")
    exit(1)

# Measure total execution time
start_time = time.time()

# Function to execute shell commands safely
def run_command(cmd, check=True):
    """ Run a shell command and handle errors. """
    try:
        result = subprocess.run(cmd, shell=True, check=check, capture_output=True, text=True)
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Error running command: {cmd}")
        print(e.stderr)
        exit(1)

# Compile Python file to LLVM IR
print("\nRunning Python to LLVM compilation...")
run_command(f'python main.py {args.filein}')

# Apply LLVM optimizations
print(f"\nRunning LLVM optimization with: {', '.join(args.opt) if args.opt else 'No optimizations'}")
if pass_string:
    run_command(f'opt-14 out.ll -o optimized.bc -passes={pass_string}')
else:
    run_command(f'cp out.ll optimized.bc')  # If no optimizations, just copy

# Generate DAG diagrams if enabled
if args.dags:
    print("\nGenerating DAG visualization...")
    run_command(f'{DEBUG_LLC} -view-dag-combine1-dags -filter-print-funcs=main optimized.bc')

# Generate RISC-V binary
binary_file = f'a_{"-".join(args.opt) if args.opt else "no-opt"}.riscv'
print("\nCompiling RISC-V binary...")
run_command(f'{RISCV_DIR}/bin/{CLANG_NAME} --sysroot={SYSROOT} -march=rv32gc -mabi=ilp32d optimized.bc readline.c -o {binary_file}')

# Ensure clean mount point
print("\nMounting root filesystem...")
run_command(f'sudo mount {FILESYSTEM} /mnt')

# Copy the binary to the filesystem
print("\nCopying binary to test environment...")
run_command(f'sudo cp {binary_file} /mnt')

# Unmount filesystem safely
print("\nUnmounting filesystem...")
run_command(f'sudo umount /mnt')

# Measure total execution time
end_time = time.time()
execution_time = end_time - start_time

# Get binary size
binary_size_kb = int(os.path.getsize(binary_file)) / 1024

# Print performance metrics
print("\n=== Build Summary ===")
print(f"Optimization: {', '.join(args.opt) if args.opt else 'No optimizations'}")
print(f"Execution Time: {execution_time:.4f} seconds")
print(f"Binary Size: {binary_size_kb:.2f} KB")
print("\nBuild completed successfully.")
