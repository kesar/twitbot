add_wast_target(twitbot twitbot.cpp twitbot.hpp)
configure_file("twitbot.abi" "${CMAKE_CURRENT_BINARY_DIR}" COPYONLY)
#target_generate_abi(twitbot twitbot.hpp)
