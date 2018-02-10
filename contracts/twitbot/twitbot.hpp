#pragma once

#include <eosiolib/eos.hpp>
#include <eosiolib/db.hpp>
#include <eosiolib/native_currency.hpp>
#include <eosiolib/table.hpp>

using namespace eosio;

namespace twitbot {
    template<account_name TwitBotAccount>
    class contract {
    public:
        /**
         *  @abi table
         */
        struct account {
            name twitter_account;
            uint64_t balance;

            EOSLIB_SERIALIZE(account, (twitter_account)(balance))
        };

        using accounts = table<N(twitbot), N(twitbot), N(account), account, name>;

        using transfer = native_currency::transfer;

        ACTION(TwitBotAccount, tip) {
            account_name from_eos;
            name to_twitter;
            uint64_t amount;

            EOSLIB_SERIALIZE(tip, (from_eos)(to_twitter)(amount));
        };

        ACTION(TwitBotAccount, withdraw) {
            account_name to_eos;

            EOSLIB_SERIALIZE(withdraw, (to_eos));
        };

        static void on(const transfer &transfer) {
            eosio::print(transfer.memo);
        };

        static void on(const tip &tip) {
            eosio::print(tip.amount);
        };

        static void on(const withdraw &withdraw) {
            eosio::print(withdraw.to_eos);
        };

        static void apply(account_name code, action_name action) {
            if (!eosio::dispatch<contract, transfer, tip, withdraw>(code, action)) {
                assert(0, "received unexpected action");
            }
        };
    };
}
