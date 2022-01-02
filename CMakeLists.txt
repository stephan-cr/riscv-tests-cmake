# CMakeLists.txt to build the RISCV ISA tests
# (https://github.com/riscv-software-src/riscv-tests)
#
# Currently, it only builds:
#
# - "ui",
# - "um",
# - "ua",
# - "uc"
#
# and partially:
#
# - "uf",
# - "ud",
# - "si" (Clang would fail),
# - "mi" (Clang would fail).
#
# That means it's not complete yet.
#
# Place this file directly or as a symlink at the root directory of
# the above repository.

cmake_minimum_required(VERSION 3.22)

project(riscv-tests LANGUAGES ASM)

set(XLEN "32" CACHE STRING "32 or 64 bit")
if(NOT XLEN MATCHES "^(32|64)$")
  message(FATAL_ERROR "XLEN must be either 32 or 64")
endif()

set(TEST_ENV "p" CACHE STRING "p, pm, pt or v")
if(NOT TEST_ENV MATCHES "^(p|pm|pt|v)$")
  message(FATAL_ERROR "TEST_ENV must be either p, pm, pt or v")
endif()

macro(add_riscv_test target_name subset)
  set(_target "rv${XLEN}${subset}-${TEST_ENV}-${target_name}")
  set(_linker_script "${CMAKE_SOURCE_DIR}/env/${TEST_ENV}/link.ld")

  add_executable(${_target}
    isa/rv${XLEN}${subset}/${target_name}.S)
  target_include_directories(${_target}
    PRIVATE
    env/${TEST_ENV}
    isa/macros/scalar)
  target_link_options(${_target} PRIVATE "LINKER:-T,${_linker_script}")
  set_target_properties(${_target} PROPERTIES LINK_DEPENDS "${_linker_script}")

  if(CMAKE_ASM_COMPILER_ID MATCHES "Clang|GNU")
    if(${subset} STREQUAL "uf")
      target_compile_options(${_target} PUBLIC -march=rv${XLEN}if)
    elseif(${subset} STREQUAL "ud")
      target_compile_options(${_target} PUBLIC -march=rv${XLEN}ifd)
    elseif(${subset} STREQUAL "um")
      target_compile_options(${_target} PUBLIC -march=rv${XLEN}im)
    elseif(${subset} STREQUAL "ui" OR ${subset} STREQUAL "si")
      target_compile_options(${_target} PUBLIC -march=rv${XLEN}i)
    elseif(${subset} STREQUAL "ua")
      target_compile_options(${_target} PUBLIC -march=rv${XLEN}ia)
    elseif(${subset} STREQUAL "uc")
      target_compile_options(${_target} PUBLIC -march=rv${XLEN}ic)
    elseif(${subset} STREQUAL "uzfh")
      target_compile_options(${_target} PUBLIC -march=rv${XLEN}i_zfh)
    endif()
  endif()

  install(TARGETS ${_target}
    CONFIGURATIONS Release)

  unset(_linker_script)
  unset(_target)
endmacro()

add_riscv_test(addi "ui")
add_riscv_test(add "ui")
add_riscv_test(andi "ui")
add_riscv_test(and "ui")
add_riscv_test(auipc "ui")
add_riscv_test(beq "ui")
add_riscv_test(bge "ui")
add_riscv_test(bgeu "ui")
add_riscv_test(blt "ui")
add_riscv_test(bltu "ui")
add_riscv_test(bne "ui")
add_riscv_test(fence_i "ui")
add_riscv_test(jalr "ui")
add_riscv_test(jal "ui")
add_riscv_test(lb "ui")
add_riscv_test(lbu "ui")
add_riscv_test(lh "ui")
add_riscv_test(lhu "ui")
add_riscv_test(lui "ui")
add_riscv_test(lw "ui")
add_riscv_test(ori "ui")
add_riscv_test(or "ui")
add_riscv_test(sb "ui")
add_riscv_test(sh "ui")
add_riscv_test(simple "ui")
add_riscv_test(slli "ui")
add_riscv_test(sll "ui")
add_riscv_test(slti "ui")
add_riscv_test(sltiu "ui")
add_riscv_test(slt "ui")
add_riscv_test(sltu "ui")
add_riscv_test(srai "ui")
add_riscv_test(sra "ui")
add_riscv_test(srli "ui")
add_riscv_test(srl "ui")
add_riscv_test(sub "ui")
add_riscv_test(sw "ui")
add_riscv_test(xori "ui")
add_riscv_test(xor "ui")

add_riscv_test(div "um")
add_riscv_test(divu "um")
add_riscv_test(mulh "um")
add_riscv_test(mulhsu "um")
add_riscv_test(mulhu "um")
add_riscv_test(mul "um")
add_riscv_test(rem "um")
add_riscv_test(remu "um")

if(NOT CMAKE_ASM_COMPILER_ID STREQUAL "Clang")
  add_riscv_test(fadd "uf") # -> doesn't work with Clang yet
endif()
add_riscv_test(fclass "uf")
if(NOT CMAKE_ASM_COMPILER_ID STREQUAL "Clang")
  add_riscv_test(fcmp "uf") # -> doesn't work with Clang yet
endif()
add_riscv_test(fcvt "uf")
add_riscv_test(fcvt_w "uf")
add_riscv_test(fdiv "uf")
add_riscv_test(fmadd "uf")
if(NOT CMAKE_ASM_COMPILER_ID STREQUAL "Clang")
  add_riscv_test(fmin "uf") # -> doesn't work with Clang yet
endif()
add_riscv_test(ldst "uf")
add_riscv_test(move "uf")
add_riscv_test(recoding "uf")

if(NOT CMAKE_ASM_COMPILER_ID STREQUAL "Clang")
  add_riscv_test(fadd "ud") # -> doesn't work with Clang yet
endif()
add_riscv_test(fclass "ud")
if(NOT CMAKE_ASM_COMPILER_ID STREQUAL "Clang")
  add_riscv_test(fcmp "ud") # -> doesn't work with Clang yet
endif()
add_riscv_test(fcvt "ud")
add_riscv_test(fcvt_w "ud")
add_riscv_test(fdiv "ud")
add_riscv_test(fmadd "ud")
if(NOT CMAKE_ASM_COMPILER_ID STREQUAL "Clang")
  add_riscv_test(fmin "ud") # -> doesn't work with Clang yet
endif()
add_riscv_test(ldst "ud")
# add_riscv_test(move "ud") # -> doesn't work yet, not really build in original source
add_riscv_test(recoding "ud")

add_riscv_test(amoadd_w "ua")
add_riscv_test(amoand_w "ua")
add_riscv_test(amomaxu_w "ua")
add_riscv_test(amomax_w "ua")
add_riscv_test(amominu_w "ua")
add_riscv_test(amomin_w "ua")
add_riscv_test(amoor_w "ua")
add_riscv_test(amoswap_w "ua")
add_riscv_test(amoxor_w "ua")
add_riscv_test(lrsc "ua")

add_riscv_test(rvc "uc")

if(NOT CMAKE_ASM_COMPILER_ID STREQUAL "Clang")
  # s-mode tests
  add_riscv_test(csr "si")
  add_riscv_test(dirty "si")
  add_riscv_test(ma_fetch "si")
  add_riscv_test(sbreak "si")
  add_riscv_test(scall "si")
  add_riscv_test(wfi "si")

  # m-mode tests
  add_riscv_test(breakpoint "mi")
  add_riscv_test(csr "mi")
  add_riscv_test(illegal "mi")
  add_riscv_test(ma_addr "mi")
  add_riscv_test(ma_fetch "mi")
  add_riscv_test(mcsr "mi")
  add_riscv_test(sbreak "mi")
  add_riscv_test(scall "mi")
  add_riscv_test(shamt "mi")
endif()

# half-precision floating-point tests
# doesn't work yet, not well supported by stock GCC and Clang
# add_riscv_test(fadd "uzfh")
# add_riscv_test(fclass "uzfh")
# add_riscv_test(fcmp "uzfh")
# add_riscv_test(fcvt "uzfh")
# add_riscv_test(fcvt_w "uzfh")
# add_riscv_test(fdiv "uzfh")
# add_riscv_test(fmadd "uzfh")
# add_riscv_test(fmin "uzfh")
# add_riscv_test(ldst "uzfh")
# add_riscv_test(move "uzfh")
# add_riscv_test(recoding "uzfh")
