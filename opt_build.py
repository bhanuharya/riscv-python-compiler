import argparse
import os
import subprocess
import time
import re

# Path Buildroot & RISC-V Toolchain
BUILDROOT_DIR = '/home/bhanuharya/Documents/buildroot-2024.02.10/output/images'
FILESYSTEM = f'{BUILDROOT_DIR}/rootfs.ext2'
RISCV_DIR = '/opt/riscv'
SYSROOT = f'{RISCV_DIR}/sysroot'
CLANG = f'{RISCV_DIR}/bin/clang'
LLVM_OBJDUMP = f'{RISCV_DIR}/bin/riscv32-unknown-linux-gnu-objdump'

# QEMU Command with Detailed Logging
QEMU_CMD = [
    "qemu-system-riscv32",
    "-M", "virt",
    "-bios", f"{BUILDROOT_DIR}/fw_jump.elf",
    "-kernel", f"{BUILDROOT_DIR}/Image",
    "-append", "rootwait root=/dev/vda ro",
    "-drive", f"file={FILESYSTEM},format=raw,id=hd0",
    "-device", "virtio-blk-device,drive=hd0",
    "-nographic",
    "-serial", "mon:stdio",
    "-d", "cpu"  # Enables detailed CPU execution logs
]

# Optimization List
allowed_passes = ['simplifycfg', 'instcombine', 'sroa', 'dce', 'gvn',
                  'loop-unroll', 'loop-vectorize', 'licm', 'inline', 'globalopt', 'dse']

parser = argparse.ArgumentParser()
parser.add_argument('filein', help="Input Python file to compile")
parser.add_argument('--opt', '-o', nargs='+', help="LLVM optimization passes")
args = parser.parse_args()

pass_string = ','.join([p for p in args.opt if p in allowed_passes]) if args.opt else ""

# 🔹 Compile Python to LLVM IR
print("🔹 Compiling Python to LLVM IR...")
if os.system(f'python main.py {args.filein}') != 0:
    exit()

# 🔹 Apply LLVM Optimizations
if pass_string:
    print(f"🔹 Applying LLVM Optimizations: {pass_string}")
    if os.system(f'opt-14 out.ll -o optimized.bc -passes={pass_string}') != 0:
        exit()
else:
    os.rename("out.ll", "optimized.bc")

# 🔹 Compile to RISC-V Executable
print("🔹 Compiling to RISC-V Executable...")
if os.system(f'{CLANG} --sysroot={SYSROOT} -march=rv32gc -mabi=ilp32d optimized.bc readline.c -o a.riscv') != 0:
    exit()

# 🔹 Get Executable Size & Instruction Count
binary_size = subprocess.getoutput("ls -lh a.riscv | awk '{print $5}'")
instruction_count = subprocess.getoutput(f"{LLVM_OBJDUMP} -d a.riscv | wc -l")

print(f"✅ Executable Size: {binary_size}")
print(f"✅ Instruction Count: {instruction_count}")

# 🔹 Ensure rootfs.ext2 is unmounted before writing
print("🔹 Checking if rootfs.ext2 is mounted...")
mount_status = subprocess.getoutput("mount | grep rootfs.ext2")
if mount_status:
    print("🔹 Unmounting rootfs.ext2...")
    os.system(f'sudo umount {FILESYSTEM}')

# 🔹 Copy Executable to Root Filesystem
print("🔹 Copying Executable to Root Filesystem...")
os.system(f'sudo mount {FILESYSTEM} /mnt')
os.system(f'sudo cp a.riscv /mnt')
os.system(f'sudo umount /mnt')

# 🔹 Run fsck to check filesystem integrity
print("🔹 Checking Filesystem Integrity...")
fsck_result = subprocess.run(["fsck.ext2", FILESYSTEM], capture_output=True, text=True)
print(fsck_result.stdout)

# 🔹 Run QEMU & Capture Output
print("🔹 Running QEMU & Executing Program...")

qemu_script = """
#!/usr/bin/expect -f
set timeout 12000
spawn qemu-system-riscv32 -M virt -bios /home/bhanuharya/Documents/buildroot-2024.02.10/output/images/fw_jump.elf \
                          -kernel /home/bhanuharya/Documents/buildroot-2024.02.10/output/images/Image \
                          -append "rootwait root=/dev/vda ro" \
                          -drive file=/home/bhanuharya/Documents/buildroot-2024.02.10/output/images/rootfs.ext2,format=raw,id=hd0 \
                          -device virtio-blk-device,drive=hd0 -nographic -serial mon:stdio
expect "buildroot login: "
send "root\\r"
expect "# "
send "cd /\\r"
expect "# "
send "time ./a.riscv\\r"
expect "# "
send "poweroff\\r"
expect eof
"""

# Write QEMU execution script
with open("qemu_script.exp", "w") as f:
    f.write(qemu_script)

# Run QEMU using expect
start_time = time.time()
qemu_result = subprocess.run(["expect", "qemu_script.exp"], capture_output=True, text=True)
end_time = time.time()

qemu_output = qemu_result.stdout
# print(qemu_output)
# 🔹 Extract Execution Output
match = re.search(r"(Welcome to Buildroot[\s\S]+?)# poweroff", qemu_output)

if match:
    filtered_output = match.group(1).strip()
else:
    filtered_output = "⚠️ Execution output not captured properly!"

# Define a more robust regex pattern
pattern = r"real\s+(\d+m\s*[\d\.]+s?)\s*\nuser\s+(\d+m\s*[\d\.]+s?)\s*\nsys\s+(\d+m\s*[\d\.]+s?)"


# Search for matches
match = re.search(pattern, filtered_output)

# Extract values if found
if match:
    real_time = match.group(1)
    user_time = match.group(2)
    sys_time = match.group(3)

else:
    print("No match found!")

# # 🔹 Extract Additional QEMU Performance Stats
# qemu_log = subprocess.getoutput("grep 'total instructions' qemu.log")

# 🔹 Display Summary
opt_name = ', '.join(args.opt) if args.opt else "None"

print("\n🔹 **Execution Output** 🔹\n")
print(filtered_output)
print("\n🔹 **Build Summary** 🔹\n")
print(f"🔹 **Optimization Used:** {opt_name}")
print(f"🔹 **Executable Size:** {binary_size}")
print(f"🔹 **Instruction Count:** {instruction_count}")
print(f"🔹 **Executable (.riscv) runtime (QEMU):** {match.group(1)} (real), {match.group(2)} (user), {match.group(3)} (sys)")

