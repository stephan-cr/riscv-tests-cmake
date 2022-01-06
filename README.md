riscv-tests - CMake
===================

Build several (not all yet) ISA tests with
[CMake](https://cmake.org/).

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
repository and copy or symlink the [CMakeLists.txt](CMakeLists.txt) to
this repository directory.

Now `cmake -S . -B build --toolchain <path-to-toolchain-file>` and
`cmake --build build/` can be run.

CMake parameters
----------------

- `XLEN`: either 32 or 64 bit (default 32 bit).
- `TEST_ENV`: Specifies the target environment name, which is either
  `p`, `pm`, `pt` or `v` (default `p`). Consult the [test virtual
  machine
  description](https://github.com/riscv-software-src/riscv-tests#test-virtual-machines)
  for the meaning of those.

"Installing" the tests
----------------------

The test binaries might be "installed" in a separate directory. To
install them in a directory, like `$HOME/riscv-tests`, run CMake like:

```shell
cmake --install build --prefix $HOME/riscv-tests
```
