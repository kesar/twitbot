#include <eosiolib/eos.hpp>
#include <eosiolib/token.hpp>
#include <eosiolib/db.hpp>

#ifndef TWITBOT
#define TWITBOT twitbot
#endif

namespace TWITBOT {
using namespace eosio;

///**
// *  @abi action
// */
//struct withdrawal {
//    account_name to;
//    tokens quantity;
//};

///**
// *  @abi action
// */
//struct tipping {
//    account_name from;
//    account_name to;
//    tokens quantity;
//};

// TODO: add proper db
// using accounts = eosio::table<N(defaultscope),N(currency),N(account),account,uint64_t>;
}
