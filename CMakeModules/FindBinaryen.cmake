# - Try to find BINARYEN
# Once done this will define
#  BINARYEN_FOUND - System has BINARYEN
#  BINARYEN_INCLUDE_DIRS - The BINARYEN include directories
#  BINARYEN_LIBRARIES - The libraries needed to use BINARYEN
#  BINARYEN_DEFINITIONS - Compiler switches required for using BINARYEN

find_file(BINARYEN_BIN s2wasm HITS ${BINARYEN_ROOT}/bin)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set BINARYEN_FOUND to TRUE
# if all listed variables are TRUE

find_package_handle_standard_args(Binaryen DEFAULT_MSG BINARYEN_BIN)

#mark_as_advanced(BINARYEN_INCLUDE_DIR BINARYEN_LIBRARY)

#set(BINARYEN_LIBRARIES ${BINARYEN_LIBRARY_CLIENT} ${BINARYEN_LIBRARY_CHAIN} ${BINARYEN_LIBRARY_FC})
#set(BINARYEN_INCLUDE_DIRS ${BINARYEN_INCLUDE_DIR})
