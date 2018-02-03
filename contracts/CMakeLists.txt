#/home/asini/opt/wasm/bin/clang -emit-llvm -O3 --std=c++14 --target=wasm32 -ffreestanding -nostdlib
#-fno-threadsafe-statics -fno-rtti -fno-exceptions -I /home/asini/opt/eosio/include -I . -c twitbot.cpp -o /tmp/tmp.Nuyg0vbbu8/built/twitbot.cpp

add_subdirectory(currency)
add_subdirectory(exchange)
add_subdirectory(infinite)
add_subdirectory(proxy)
add_subdirectory(simpledb)
add_subdirectory(storage)
add_subdirectory(test_api)
add_subdirectory(twitbot)


