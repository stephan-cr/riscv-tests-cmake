set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

set(CMAKE_ASM_COMPILER riscv64-elf-gcc)
set(CMAKE_ASM_FLAGS "-mabi=lp64 -march=rv64imac -nostartfiles -mno-relax -mcmodel=medany")

set(CMAKE_C_COMPILER riscv64-elf-gcc)
set(CMAKE_C_FLAGS "-mabi=lp64 -march=rv64imac -mno-relax -nostartfiles -nodefaultlibs -mcmodel=medany")

set(CMAKE_EXE_LINKER_FLAGS "-Wl,--no-warn-rwx-segments")
