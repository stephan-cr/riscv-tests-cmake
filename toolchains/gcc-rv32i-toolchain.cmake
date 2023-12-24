set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv32)

set(CMAKE_ASM_COMPILER riscv64-elf-gcc)
set(CMAKE_ASM_FLAGS "-mabi=ilp32 -march=rv32i -nostartfiles -mno-relax")

set(CMAKE_C_COMPILER riscv64-elf-gcc)
set(CMAKE_C_FLAGS "-mabi=ilp32 -march=rv32i -mno-relax -nostartfiles -nodefaultlibs")

set(CMAKE_EXE_LINKER_FLAGS "-Wl,--no-warn-rwx-segments")

# paths to newlib
include_directories(SYSTEM /usr/riscv32-elf/include)
link_directories(/usr/riscv32-elf/lib)
