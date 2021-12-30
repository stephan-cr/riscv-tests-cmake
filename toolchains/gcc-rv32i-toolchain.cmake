set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv32)

set(CMAKE_ASM_COMPILER riscv64-elf-gcc)
set(CMAKE_ASM_FLAGS "-mabi=ilp32 -march=rv32i -nostdlib -mno-relax")
