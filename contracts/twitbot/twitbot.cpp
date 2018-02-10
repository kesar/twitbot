#include "twitbot.hpp"

extern "C" {
void apply(uint64_t code, uint64_t action) {
    eosio::print("account: ", eosio::name(code), ", act: ", eosio::name(action), "\n");
    twitbot::contract < N(twitbot) > ::apply(code, action);
}
}
