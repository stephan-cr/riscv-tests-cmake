riscv-tests - CMake
===================

Build several (not all yet) tests with CMake.

The advantage is, that these tests could easily build with
[Clang](https://clang.llvm.org/) or any other non-standard GCC cross
compiler.

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
