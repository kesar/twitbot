#pragma once

#include <eosiolib/eos.hpp>
#include <eosiolib/action.hpp>
#include <eosiolib/dispatcher.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/string.hpp>
#include <eosiolib/token.hpp>
#include <eosiolib/db.hpp>
#include <eosiolib/native_currency.hpp>

using namespace eosio;


namespace twitbot {
class contract {
public:
    typedef native_currency::transfer transfer;
//    ACTION( N(eosio), transfer ) {
//        account_name from;
//        account_name to;
//        uint64_t     quantity;
//        string       memo;

//        EOSLIB_SERIALIZE(transfer, (from)(to)(quantity)(memo))
//    };

    static void on( const transfer& act ) {
        eosio::print("and the memo is ... ", act.memo, "\n");
    }
};
}






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

