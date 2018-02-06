#pragma once

#include <eosiolib/eos.hpp>
#include <eosiolib/action.hpp>
#include <eosiolib/dispatcher.hpp>
#include <eosiolib/asset.hpp>

namespace twitbot {
class contract {
public:
    static void apply( account_name code, action_name action) {
        //eosio::dispatch<generic_currency, transfer_memo, issue>(c,act);
        eosio::print("account: ", eosio::name(code), ", act: ", eosio::name(action), "\n");

        if (code == N(eosio) && action == N(transfer)) {
            eosio::print("Transfer received!\n");
        }
        else
            eosio::print("not received\n");
    }
};

} // namespace

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

