
# This file details the proccess for setting up RISCV32 compilation:


+ Make sure that the value of REGISTER_SIZE in src/constants.py is 32

+ Install LLVM 14
    - Running `sudo apt install llvm-14` should work

+ Build DAG tools for LLVM 14
    - This step requires a while to complete, it may take a couple of hours so make sure you don't need your PC during this time
    - Clone the llvm repository `git clone https://github.com/llvm/llvm-project.git -b release/14.x`
    - CD into it, make a build directory and cd into that one
    ```
    cd llvm-project
    mkdir build
    cd build
    ```
    - Make sure you have `ninja` installed
    - Configure with cmake, we will need a debug build with assertions
    ```
    cmake -G Ninja \
        -DLLVM_ENABLE_PROJECTS="llvm" \
        -DCMAKE_BUILD_TYPE=Debug \
        -DLLVM_ENABLE_THREADS=ON \
        ../llvm
    ```
    - Now compile llc, for maximum speed use the exact number of threads your PC has
    ```
    ninja llc -j <NUMBER OF THREADS>
    ```
    - The output file should be in `./bin/llc`

+ Run this command to install the required python packages
```
pip install -r requirements.txt
```

+ Install a riscv32 GNU toolchain
    - There doesn't seem to be any prebuilt riscv32 toolchains for Debian based systems
    - To build it from scratch you can try out these commands
    ```
    git clone https://github.com/riscv/riscv-gnu-toolchain
    sudo apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build
    ./configure --prefix=/opt/riscv --with-arch=rv32gc --with-abi=ilp32d
    make linux
    ```
    - For further information checkout the [github repository](https://github.com/riscv-collab/riscv-gnu-toolchain)

+ Install QEMU for riscv32
    - Simply running `sudo apt install qemu-system-misc` should do it
    - Check if it is installed by running `qemu-system-riscv32 --version`

+ You will also need a system to emulate, for that you can use [buildroot](https://buildroot.org/download.html)
    - Download it and extract it
    - CD inside the folder and run `make list-defconfigs` to see all the configurations
    - Locate the one for riscv32, it should be qemu_riscv32_virt_defconfig
    - Run `make qemu_riscv32_virt_defconfig`
    - Now run `make` to generate the virtual system, this might take a while
    - You can now CD into output/images to find your new RISCV32 system
    - To run it simply run the shell script `./start_qemu.sh`

+ Setup the build script
    - The build script in the repository is called `opt_build.py` or `build.py`
    - Inside there are a couple of variables you will need to change
    - Change BUILDROOT_DIR to the ouput/images directory of your buildroot installation
    - Change RISCV_DIR to the location of your riscv installation, it should be in /opt/riscv
    - Change DEBUG_LLC to the full path of the llc that was built in step 3

The build script should now work, simply run `python build.py`. The script will invoke the python compiler, after which it will use opt-14 to optimize the output.
Then it will use llc to open dag diagrams, after which it will use clang to output a binary file.
It will then mount the buildroot file system, write the binary file to the root of it, and unmount it

When the compilation is done you can run the `start_qemu.sh` script and in the root directory `/` you will find a.riscv.

Make sure not to run the compiler while the system is running or it may cause corruption. If it corruption does occur, closing the vm and running `fsck.ext2 rootfs.ext2` should fix it.

