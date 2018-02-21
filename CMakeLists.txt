project(twitbot)
cmake_minimum_required(VERSION 3.8.2)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules")

FIND_PACKAGE(Boost 1.64 REQUIRED COMPONENTS
    thread
    date_time
    filesystem
    system
    program_options
    signals
    serialization
    chrono
    unit_test_framework
    context
    locale
    iostreams)

add_subdirectory(contracts)
