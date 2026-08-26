# Runtime model

This document describes how pyrv programs execute once compiled to RISC-V32.
It is a companion to `docs/language-spec.md`.

## 1. Target

* **Architecture**: `riscv32` (RV32GC: I+M+A+F+D+C).
* **ABI**: `ilp32d` (32-bit `int`/pointers, 64-bit `double`).
* **Triple**: `riscv32-unknown-linux-gnu`.
* **Data layout**: `e-m:e-p:32:32-i32:32-i16:16-i8:8-n32-S32`.
  `p:32:32` is load-bearing: pointers are 32-bit, which the SROA pass must
  know to scalar-replace slice aggregates correctly. The backend sets this
  explicitly.

## 2. Memory model

Each value lives in one of two forms:

* **Loadable scalars** (`int`, `float`, `bool`, `char`) are held directly in
  an alloca'd slot and loaded/stored by value. `int` is `i32`, `float` is
  `double`, `bool` is `i1`, `char` is `i8`.
* **Aggregates** (`str`, `list[T]`, functions) are non-loadable. A variable
  of these types is an alloca of a **slice descriptor**:

  ```c
  // list[T] and str share this layout
  struct slice {
      int32_t count;      // number of elements (bytes for str)
      T*      data;       // pointer to element buffer
  };
  ```

  The descriptor is 8 bytes (`{ i32, i8* }` / `{ i32, T* }`) on RV32.

### 2.1 List/string construction

`[a, b, c]`:
1. Allocate a slice descriptor.
2. Store `count = 3`.
3. Allocate a buffer of 3 elements.
4. Store the buffer pointer in the descriptor.
5. Store each element into the buffer.

String literals are lowered to a private constant global byte array (plus NUL
terminator) and wrapped in a descriptor pointing at it.

### 2.2 Assignment and argument passing

* Scalars: copied by value.
* Aggregates: the 8-byte descriptor is copied (`llvm.memcpy`), so two names
  refer to the same element buffer (reference semantics).

Function parameters follow the same rule. Aggregate parameters are passed as
pointers to descriptors (the function type wraps them in `T*`).

### 2.3 Lifetimes

* **Slice descriptors** (the `{i32 count, T* data}` struct) are
  stack-allocated (LLVM `alloca`). They live for the duration of the
  function that created them.
* **Element buffers** are heap-allocated via `pyr_alloc` (a bump
  allocator in `runtime.c`). The heap is a single 16 MB mmap'd region;
  allocations are 8-byte aligned and never freed individually. This
  means buffers can safely outlive the function that allocated them
  (returned strings/lists, lists passed to functions that mutate them,
  etc.).
* `input()` obtains a buffer via `mmap` from the C `readline` helper,
  which is also a heap allocation and has the same lifetime property.

## 3. Calling convention

User functions are lowered to LLVM functions named
`<module>.<function-name>`. `main` is an `i32` function taking no arguments;
it always returns `0` on normal completion (the exit status).

## 4. Runtime support (C)

`readline.c` provides the `readline(const char *prompt)` helper used by
`input()`. `runtime.c` provides the bump allocator (`pyr_alloc_init` and
`pyr_alloc`) used for list/string element buffers. `printf`, `memcmp`,
`memcpy`, and `strlen` come from libc. The module declares these and links
against glibc at the final link step.

## 5. Execution and exit status

The linked executable runs under QEMU (user mode or system mode with a
Buildroot rootfs). A successful run produces stdout from `print`/`input` and
exits with status 0. There is no exception machinery: undefined behaviors
(division by zero for ints, out-of-range indexing, out-of-range
`int(float)`) are hardware/UB and may crash or produce garbage — see
`docs/language-spec.md` §8.
