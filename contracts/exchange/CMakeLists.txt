file(GLOB ABI_FILES "*.abi")
add_wast(exchange exchange.cpp)
configure_file("${ABI_FILES}" "${CMAKE_CURRENT_BINARY_DIR}" COPYONLY)
add_dependencies( exchange currency )
