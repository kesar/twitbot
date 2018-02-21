#add_wast_target(twitbot twitbot.cpp twitbot.hpp)
#configure_file("twitbot.abi" "${CMAKE_CURRENT_BINARY_DIR}" COPYONLY)
#target_generate_abi(twitbot twitbot.hpp)

file(GLOB ABI_FILES "*.abi")
configure_file("${ABI_FILES}" "${CMAKE_CURRENT_BINARY_DIR}" COPYONLY)

add_wast_executable(TARGET twitbot
  INCLUDE_FOLDERS "${STANDARD_INCLUDE_FOLDERS}"
  LIBRARIES libc++ libc eosiolib
  DESTINATION_FOLDER ${CMAKE_CURRENT_BINARY_DIR}
)
