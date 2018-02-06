#pragma once

#include <eosiolib/eos.hpp>
#include <eosiolib/action.hpp>

namespace twitbot {
class contract {
public:
    static void apply( account_name c, action_name act) {
       //eosio::dispatch<generic_currency, transfer_memo, issue>(c,act);
        eosio::print("account: ", eosio::name(c), ", act: ", eosio::name(act), "\n");
    }

    ACTION( code, transfer ){

    };
};

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
