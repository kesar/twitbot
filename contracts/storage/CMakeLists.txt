file(GLOB ABI_FILES "*.abi")
add_wast(storage storage.cpp)
configure_file("${ABI_FILES}" "${CMAKE_CURRENT_BINARY_DIR}" COPYONLY)
