#pragma once

#include <eosiolib/eos.hpp>
#include <eosiolib/db.hpp>
#include <eosiolib/native_currency.hpp>

namespace twitbot {
class contract {
public:
    typedef eosio::native_currency::transfer transfer;

    static void on( const transfer& act ) {
        eosio::print("and the memo is ... ", act.memo, "\n");
    }
};
}
