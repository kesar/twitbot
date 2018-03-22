#pragma once

#include <eosiolib/eosio.hpp>
#include <eosiolib/multi_index.hpp>
#include <eosiolib/native_currency.hpp>

using namespace eosio;

namespace twitbot {

    class contract {
        static const uint64_t code = N(twitbot);

    public:
        struct account {
            account_name name;
            uint64_t balance;
            string twitter;

            uint64_t primary_key() const { return name; }

            static key256 key(string twitter) {
                return key256::make_from_word_sequence<uint64_t>(string_to_name(twitter.c_str()));
            }

            key256 get_key() const { return key(twitter); }


            EOSLIB_SERIALIZE(account, (name)(balance)(twitter))
        };

        typedef eosio::multi_index<N(accounts), account,
                eosio::indexed_by<N(bytwitter), eosio::const_mem_fun<account, key256, &account::get_key> >
        > account_index_type;

        using transfer = native_currency::transfer;

        ACTION(code, tip) {
            string from_twitter;
            string to_twitter;
            uint64_t quantity;

            EOSLIB_SERIALIZE(tip, (from_twitter)(to_twitter)(quantity));
        };

        ACTION(code, withdraw) {
            account_name to_eos;
            string from_twitter;

            EOSLIB_SERIALIZE(withdraw, (to_eos)(from_twitter));
        };

        ACTION(code, claim) {
            account_name to_eos;
            string from_twitter;

            EOSLIB_SERIALIZE(withdraw, (to_eos)(from_twitter));
        };

        static void on(const transfer &transfer);

        static void on(const tip &tip);

        static void on(const claim &claim);

        static void on(const withdraw &withdraw);
    };

}
