# - Try to find EOS
# Once done this will define
#  EOS_FOUND - System has EOS
#  EOS_INCLUDE_DIRS - The EOS include directories
#  EOS_LIBRARIES - The libraries needed to use EOS
#  EOS_DEFINITIONS - Compiler switches required for using EOS

#/home/asini/opt/wasm/bin/llvm-config

find_file(WASM_LLVM_CONFIG llvm-config HITS ${WASM_ROOT}/bin)

if(WASM_LLVM_CONFIG)
  execute_process(
    COMMAND ${WASM_LLVM_CONFIG} --bindir
    RESULT_VARIABLE WASM_LLVM_CONFIG_OK
    OUTPUT_VARIABLE WASM_LLVM_BIN
  )
endif()

#if("${WASM_LLVM_CONFIG_OK}" STREQUAL "0")

find_file(WASM_CLANG clang HITS ${WASM_LLVM_BIN})
find_file(WASM_LLC llc HITS ${WASM_LLVM_BIN})
find_file(WASM_LLVM_LINK llvm-link HITS ${WASM_LLVM_BIN})

message(STATUS "Found Wasm clang: ${WASM_CLANG}")
message(STATUS "Found Wasm llc: ${WASM_LLC}")
message(STATUS "Found Wasm llvm-link: ${WASM_LLVM_LINK}")

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set EOS_FOUND to TRUE
# if all listed variables are TRUE

find_package_handle_standard_args(Wasm DEFAULT_MSG WASM_LLVM_CONFIG)

#mark_as_advanced(EOS_INCLUDE_DIR EOS_LIBRARY)

#set(EOS_LIBRARIES ${EOS_LIBRARY_CLIENT} ${EOS_LIBRARY_CHAIN} ${EOS_LIBRARY_FC})
#set(EOSIO_INCLUDE_DIRS ${EOSIO_INCLUDE_DIR})
