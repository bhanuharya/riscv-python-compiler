#!/bin/bash

# Exit if any command fails
set -e

# Compile the python file
python main.py test.py

# Setup the paths for riscv tools
BUILDROOT_DIR='/home/bhanuharya/Documents/PythonRISCVCompiler/buildroot-2024.02.10/output/images'
FILESYSTEM=f'{BUILDROOT_DIR}/rootfs.ext2'
RISCV_DIR='/opt/riscv'
SYSROOT=f'{RISCV_DIR}/sysroot/usr/include'
DEBUG_LLC=f'/home/bhanuharya/Documents/llvm-project/build/bin/llc'
CLANG_NAME='clang'



opt-14 -O2 out.ll -o optimized.bc
#$DEBUG_LLC -view-dag-combine1-dags -filter-print-funcs=main optimized.bc

# Compile the llvm output for riscv32
$RISCV_DIR/bin/clang --sysroot=$SYSROOT \
	optimized.bc readline.c -o a.riscv

sudo mount $FILESYSTEM /mnt
sudo cp a.riscv /mnt
sudo umount /mnt
echo Done

