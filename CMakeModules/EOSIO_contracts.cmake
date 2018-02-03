find_package(EOS REQUIRED)
find_package(Wasm REQUIRED)
find_package(Binaryen REQUIRED)

macro(add_wast target)

    set(list_var "${ARGN}")
    foreach(srcfile IN LISTS list_var)
        add_custom_command(OUTPUT ${srcfile}.bc
            COMMAND ${WASM_CLANG} -emit-llvm -O3 --std=c++14 --target=wasm32 -ffreestanding
            -nostdlib -fno-threadsafe-statics -fno-rtti -fno-exceptions -I${EOSIO_INCLUDE_DIRS}
            -c "${CMAKE_CURRENT_SOURCE_DIR}/${srcfile}" -o ${srcfile}.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            )
        set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES ${srcfile}.bc)
        list(APPEND outfiles ${srcfile}.bc)
    endforeach()

    add_custom_command(OUTPUT ${target}.wast
        DEPENDS ${outfiles}
        COMMAND ${WASM_LLVM_LINK} -o ${target}.bc ${outfiles}
        COMMAND ${WASM_LLC} -asm-verbose=false -o ${target}.s ${target}.bc
        COMMAND ${BINARYEN_BIN} -o ${target}.wast -s 1024 ${target}.s
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        VERBATIM
        )
    set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES ${target}.bc ${target}.s ${target}.wast)

    add_custom_target(${target} ALL DEPENDS ${target}.wast)
endmacro()
