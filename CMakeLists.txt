#list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules")
#set(CMAKE_TOOLCHAIN_FILE "CMakeModules/clang_wasm_toolchain.cmake")
cmake_minimum_required(VERSION 3.8.2)

project(twitbot)




add_subdirectory(contracts)
