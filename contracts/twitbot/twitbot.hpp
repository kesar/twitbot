#pragma once

#include <eosiolib/eosio.hpp>
#include <eosiolib/table.hpp>
#include <eosiolib/native_currency.hpp>

using namespace eosio;

namespace twitbot {

    class contract {
        static const uint64_t code = N(twitbot);

    public:
        struct account {
            name twitter_account;
            uint64_t balance;

            EOSLIB_SERIALIZE(account, (twitter_account)(balance))
        };

        using accounts = table64<
                code, // scope
                N(account), // table
                code, // tba
                account // record struct
        >;

        using transfer = native_currency::transfer;

        ACTION(code, tip) {
            name from_twitter;
            name to_twitter;
            uint64_t quantity;

            EOSLIB_SERIALIZE(tip, (from_twitter)(to_twitter)(quantity));
        };

        ACTION(code, withdraw) {
            account_name to_eos;
            name from_twitter;

            EOSLIB_SERIALIZE(withdraw, (to_eos)(from_twitter));
        };

        static void on(const transfer &transfer);

        static void on(const tip &tip);

        static void on(const withdraw &withdraw);
    };

}
