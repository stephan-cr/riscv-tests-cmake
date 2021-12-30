riscv-tests - CMake
===================

Build several (not all yet) tests with CMake.

The advantage is, that these tests could easily build with
[Clang](https://clang.llvm.org/) or any other non-standard GCC cross
compiler via [CMake toolchain
files](https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html).

Two example toolchains are provided, namely one for
[Clang/RV32](toolchains/clang-rv32i-toolchain.cmake) and the other one
[riscv64-elf-gcc to build the
RV32*](toolchains/gcc-rv32i-toolchain.cmake) tests.

How to use
----------

Clone the
[riscv-tests](https://github.com/riscv-software-src/riscv-tests)
repositoy and copy or symlink the [CMakeLists.txt](CMakeLists.txt) to
this repository directory.

Now `cmake -S . -B build --toolchain <path-to-toolchain-file>` and
`cmake --build build/` can be run.

CMake parameters
----------------

- `XLEN`: either 32 or 64 bit
- `TEST_ENV`: Specifies the target environment name, which is either
  `p`, `pm`, `pt` or `v`. Consult the [test virtual machine
  description](https://github.com/riscv-software-src/riscv-tests#test-virtual-machines)
  for the meaning of those.
