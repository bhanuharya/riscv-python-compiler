# Makefile for compiling Cython to C, creating an object file, and then linking to create an executable

# Define variables
CYTHON = cython
PYTHON = python3
CFLAGS = -O3
LDFLAGS = -lpython3.8  # Replace with your Python version if different
CLANG = clang
SRC_DIR = src
BUILD_DIR = build
MACHINE_CODE_DIR = machine_code
PYTHON_VERSION = $(shell $(PYTHON) -c "import sys; print(sys.version[:3])")

# Paths to Python include and library directories
PYTHON_INCLUDE = $(shell $(PYTHON) -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
PYTHON_LIBDIR = $(shell $(PYTHON) -c "from distutils.sysconfig import get_config_var; print(get_config_var('LIBDIR'))")

# Source and target files
TARGET = $(MACHINE_CODE_DIR)/bubble_sort
CYTHON_SRC = $(SRC_DIR)/bubble_sort.pyx
C_SRC = $(SRC_DIR)/bubble_sort.c
OBJECT_FILE = $(MACHINE_CODE_DIR)/bubble_sort.o

# Create machine_code directory if it doesn't exist
$(shell mkdir -p $(MACHINE_CODE_DIR))

# Rule to compile Cython to C
$(C_SRC): $(CYTHON_SRC)
	$(CYTHON) --cplus -3 -o $@ $<

# Rule to create object file from C source
$(OBJECT_FILE): $(C_SRC)
	$(CLANG) $(CFLAGS) -I$(PYTHON_INCLUDE) -c $< -o $@

# Rule to link object file and create the executable
$(TARGET): $(OBJECT_FILE)
	$(CLANG) $(OBJECT_FILE) -L$(PYTHON_LIBDIR) $(LDFLAGS) -o $@

# Phony targets
.PHONY: clean

# Clean build artifacts
clean:
	rm -rf $(MACHINE_CODE_DIR)/*.o $(SRC_DIR)/*.c $(TARGET)
