# - Try to find EOS
# Once done this will define
#  EOSIO_FOUND - System has EOS
#  EOSIO_INCLUDE_DIRS - The EOS include directories
#  EOSIO_LIBRARIES - The libraries needed to use EOS
#  EOSIO_DEFINITIONS - Compiler switches required for using EOS

find_path(EOSIO_INCLUDE_DIR eosiolib/eos.hpp HINTS ${EOSIO_ROOT}/include)
find_file(EOSIO_ABI_GEN abi_gen HITS ${EOSIO_ROOT}/bin)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set EOSIO_FOUND to TRUE
# if all listed variables are TRUE

find_package_handle_standard_args(EOS DEFAULT_MSG EOSIO_ABI_GEN EOSIO_INCLUDE_DIR)

#mark_as_advanced(EOSIO_INCLUDE_DIR EOSIO_LIBRARY)

#set(EOSIO_LIBRARIES ${EOSIO_LIBRARY_CLIENT} ${EOSIO_LIBRARY_CHAIN} ${EOSIO_LIBRARY_FC})
set(EOSIO_INCLUDE_DIRS ${EOSIO_INCLUDE_DIR})
