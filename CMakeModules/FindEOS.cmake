# - Try to find EOS
# Once done this will define
#  EOS_FOUND - System has EOS
#  EOS_INCLUDE_DIRS - The EOS include directories
#  EOS_LIBRARIES - The libraries needed to use EOS
#  EOS_DEFINITIONS - Compiler switches required for using EOS

find_path(EOSIO_INCLUDE_DIR eoslib/eos.hpp HINTS ${EOS_ROOT}/include)
find_file(EOSIO_ABI_GEN abi_gen HITS ${EOS_ROOT}/bin)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set EOS_FOUND to TRUE
# if all listed variables are TRUE

find_package_handle_standard_args(EOS DEFAULT_MSG EOSIO_ABI_GEN EOSIO_INCLUDE_DIR)

#mark_as_advanced(EOS_INCLUDE_DIR EOS_LIBRARY)

#set(EOS_LIBRARIES ${EOS_LIBRARY_CLIENT} ${EOS_LIBRARY_CHAIN} ${EOS_LIBRARY_FC})
set(EOSIO_INCLUDE_DIRS ${EOSIO_INCLUDE_DIR})
