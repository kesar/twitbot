#pragma once

#include <eosiolib/eos.hpp>
#include <eosiolib/db.hpp>
#include <eosiolib/native_currency.hpp>
#include <eosiolib/table.hpp>

using namespace eosio;

namespace twitbot {
class contract {
public:
    /**
     *  @abi table
     */
    struct account {
       name twitter_account;
       uint64_t balance;
       EOSLIB_SERIALIZE( account, (twitter_account)(balance) )
    };
    using accounts = table<N(twitbot), N(twitbot), N(account), account, name >;

    using transfer = native_currency::transfer;
    static void on( const transfer& act ) {
        print("and the memo is ... ", act.memo, "\n");
        //account a = {act.memo, act.quantity};
    }
};

}
