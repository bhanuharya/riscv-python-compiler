import argparse
import os


BUILDROOT_DIR='/home/bhanuharya/Documents/buildroot-2024.02.10/output/images'
FILESYSTEM=f'{BUILDROOT_DIR}/rootfs.ext2'
RISCV_DIR='/opt/riscv'
SYSROOT=f'{RISCV_DIR}/sysroot'
DEBUG_LLC=f'/home/bhanuharya/Documents/llvm-project/build/bin/llc'
CLANG_NAME='clang'

optimizatioms_help = r"""
    Basic optimizations:
    simplifycfg - Simplify Control Flow Graph
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

    
    You can read more about these passes here: https://llvm.org/docs/Passes.html
"""

parser = argparse.ArgumentParser(prog='build', formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('filein')
parser.add_argument('--dags', help='Show diagrams for dag based optimizations')
parser.add_argument('--opt', '-o', nargs='+', help=optimizatioms_help)
args = parser.parse_args()

allowed_passes = ['simplifycfg', 'instcombine', 'instcombine', 'sroa', 'dce', 'gvn',
                  'memcpyopt', 'sccp', 'reassociate', 'loop-simplify', 'loop-unroll',
                  'loop-vectorize', 'licm', 'function-attrs', 'inline', 'globalopt', 'argpromotion', 'dse', 'deadargelim', 'mldst-motion']

pass_string = ''
if args.opt is not None:
    for idx, p in enumerate(args.opt):
        if p not in allowed_passes:
            print(f'Unknown pass {p}')
            exit()
    
        if idx != 0:
            pass_string += ','
        pass_string += p



if os.system(f'python main.py {args.filein}') != 0:
    exit()
if os.system(f'opt-14 out.ll -o optimized.bc -passes={pass_string}') != 0:
    exit()
# Generate RISC-V assembly from LLVM bitcode
if os.system(f'{DEBUG_LLC} -march=riscv32 -mattr=+m,+a,+f,+d optimized.bc -o optimized.s') != 0:
    exit()

if args.dags:
    if os.system(f'{DEBUG_LLC} -view-dag-combine1-dags -filter-print-funcs=main optimized.bc') != 0:
        exit()

if os.system(f'{RISCV_DIR}/bin/{CLANG_NAME} --sysroot={SYSROOT} -march=rv32gc -mabi=ilp32d optimized.bc readline.c -o a.riscv') != 0:
    exit()
if os.system(f'sudo mount {FILESYSTEM} /mnt') != 0:
    exit()
if os.system(f'sudo cp a.riscv /mnt') != 0:
    exit()
if os.system(f'sudo umount /mnt') != 0:
    exit()
print('Done')

