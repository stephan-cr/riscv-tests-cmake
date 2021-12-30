set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv32)

set(triple riscv32)

set(CMAKE_ASM_COMPILER clang)
set(CMAKE_ASM_FLAGS "-nostdlib -mno-relax")
set(CMAKE_ASM_COMPILER_TARGET ${triple})

set(CMAKE_C_COMPILER clang)
set(CMAKE_C_COMPILER_TARGET ${triple})

set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_CXX_COMPILER_TARGET ${triple})
