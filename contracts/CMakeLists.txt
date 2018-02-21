include(wasm)

set(DEFAULT_SYSTEM_INCLUDE_FOLDERS ${CMAKE_SOURCE_DIR}/contracts/libc++/upstream/include ${CMAKE_SOURCE_DIR}/contracts/musl/upstream/include ${Boost_INCLUDE_DIR})

set(STANDARD_INCLUDE_FOLDERS ${CMAKE_SOURCE_DIR}/contracts)

#include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(eosiolib)
add_subdirectory(libc++)
add_Subdirectory(musl)
add_subdirectory(twitbot)


