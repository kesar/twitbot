file(GLOB ABI_FILES "*.abi")
add_wast(currency currency.cpp)
configure_file("${ABI_FILES}" "${CMAKE_CURRENT_BINARY_DIR}" COPYONLY)
