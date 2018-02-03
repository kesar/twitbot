file(GLOB ABI_FILES "*.abi")
#add_wast_target(currency "${CMAKE_SOURCE_DIR}/contracts" ${CMAKE_CURRENT_BINARY_DIR})
add_library(currency currency.cpp)
configure_file("${ABI_FILES}" "${CMAKE_CURRENT_BINARY_DIR}" COPYONLY)
