set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

set(CMAKE_ASM_COMPILER riscv64-elf-gcc)
set(CMAKE_ASM_FLAGS "-mabi=lp64 -march=rv64i -nostdlib -mno-relax")
