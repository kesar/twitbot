project(twitbot)
cmake_minimum_required( VERSION 2.8.12 )

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules")

include(EOSIO_contracts)

include_directories(${EOSIO_INCLUDE_DIRS})

add_definitions(-emit-llvm -O3 --std=c++14 --target=wasm32 -ffreestanding -nostdlib -fno-threadsafe-statics -fno-rtti -fno-exceptions)

add_subdirectory(currency)
add_subdirectory(contracts)
