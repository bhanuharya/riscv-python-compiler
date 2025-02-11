import argparse
import os
import time
import subprocess

# Define directories
BUILDROOT_DIR = '/home/bhanuharya/Documents/buildroot-2024.02.10/output/images'
FILESYSTEM = f'{BUILDROOT_DIR}/rootfs.ext2'
RISCV_DIR = '/opt/riscv'
SYSROOT = f'{RISCV_DIR}/sysroot'
DEBUG_LLC = '/home/bhanuharya/Documents/llvm-project/build/bin/llc'
CLANG_NAME = 'clang'

# Optimization categories
DAG_OPTIMIZATIONS = "loop-vectorize,licm,dce,gvn"
TRADITIONAL_OPTIMIZATIONS = "instcombine,sroa,inline,dce,gvn"
NO_OPTIMIZATION = ""

# Optimization types
OPTIMIZATIONS = {
    "dag": DAG_OPTIMIZATIONS,
    "traditional": TRADITIONAL_OPTIMIZATIONS,
    "none": NO_OPTIMIZATION
}

# Function to execute a shell command and measure execution time
def run_command(command, capture_output=False):
    print(f"\n🔹 Running: {command}")
    start_time = time.time()
    result = subprocess.run(command, shell=True, capture_output=capture_output, text=True)
    end_time = time.time()
    return result.returncode, end_time - start_time, result.stdout if capture_output else None

# Function to handle compilation and benchmarking for each optimization
def compile_and_run(filein, opt_name, passes):
    print(f"\n===  Running with {opt_name.upper()} Optimizations ===")

    # Run Python-to-LLVM conversion
    if run_command(f'python main.py {filein}')[0] != 0:
        print("X Error running main.py")
        return

    # Apply LLVM optimizations
    llvm_opt_file = f"optimized_{opt_name}.bc"
    opt_command = f'opt-14 out.ll -o {llvm_opt_file} -passes={passes}'
    if run_command(opt_command)[0] != 0:
        print(f"X Error optimizing with {opt_name}")
        return

    # Generate DAG visualization (only for DAG optimizations)
    if opt_name == "dag":
        dag_command = f'{DEBUG_LLC} -view-dag-combine1-dags -filter-print-funcs=main {llvm_opt_file}'
        run_command(dag_command)

    # Compile to RISC-V binary
    binary_name = f"a_{opt_name}.riscv"
    clang_command = f'{RISCV_DIR}/bin/{CLANG_NAME} --sysroot={SYSROOT} -march=rv32gc -mabi=ilp32d {llvm_opt_file} readline.c -o {binary_name}'
    if run_command(clang_command)[0] != 0:
        print(f"X Error compiling {opt_name} binary")
        return

    # Mount Buildroot filesystem and copy binary
    run_command(f'sudo mount {FILESYSTEM} /mnt')
    run_command(f'sudo cp {binary_name} /mnt')
    run_command(f'sudo umount /mnt')

    # Measure execution time on QEMU
    qemu_command = f'time qemu-system-riscv32 -M virt -kernel {binary_name} -nographic'
    _, runtime, qemu_output = run_command(qemu_command, capture_output=True)

    # Get binary size
    binary_size = os.path.getsize(binary_name) / 1024  # Convert to KB

    # Display results for this optimization type
    print(f"\n RESULTS for {opt_name.upper()}")
    print(f"   - Execution Time: {runtime:.5f} seconds")
    print(f"   - Binary Size: {binary_size:.2f} KB")
    print(f"   - QEMU Output: \n{qemu_output.strip()}\n")
    print("=" * 60)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog="build", formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument("filein", help="Input Python file to compile")
    args = parser.parse_args()

    for opt_name, passes in OPTIMIZATIONS.items():
        compile_and_run(args.filein, opt_name, passes)
