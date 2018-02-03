# - Try to find EOS
# Once done this will define
#  EOS_FOUND - System has EOS
#  EOS_INCLUDE_DIRS - The EOS include directories
#  EOS_LIBRARIES - The libraries needed to use EOS
#  EOS_DEFINITIONS - Compiler switches required for using EOS

#/home/asini/opt/wasm/bin/llvm-config

find_file(WASM_LLVM_CONFIG llvm-config HITS ${WASM_ROOT}/bin NO_DEFAULT_PATH)
find_file(WASM_CLANG clang HITS ${WASM_ROOT}/bin NO_DEFAULT_PATH)
find_file(WASM_LLC llc HITS ${WASM_ROOT}/bin NO_DEFAULT_PATH)
find_file(WASM_LLVM_LINK llvm-link HITS ${WASM_ROOT}/bin NO_DEFAULT_PATH)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set EOS_FOUND to TRUE
# if all listed variables are TRUE

find_package_handle_standard_args(Wasm DEFAULT_MSG WASM_LLVM_CONFIG)
find_package_handle_standard_args(WASM_CLANG DEFAULT_MSG WASM_CLANG)
find_package_handle_standard_args(WASM_LLC DEFAULT_MSG WASM_LLC)
find_package_handle_standard_args(WASM_LLVM_LINK DEFAULT_MSG WASM_LLVM_LINK)


#mark_as_advanced(EOS_INCLUDE_DIR EOS_LIBRARY)

#set(EOS_LIBRARIES ${EOS_LIBRARY_CLIENT} ${EOS_LIBRARY_CHAIN} ${EOS_LIBRARY_FC})
#set(EOSIO_INCLUDE_DIRS ${EOSIO_INCLUDE_DIR})
