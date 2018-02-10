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

        using accounts = table<
                N(twitbot), // scope
                N(twitbot), // code
                N(account), // table
                account, // record struct
                name // primary key
        >;

        using transfer = native_currency::transfer;

        ACTION(TwitBotAccount, tip) {
            name from_twitter;
            name to_twitter;
            uint64_t quantity;

            EOSLIB_SERIALIZE(tip, (from_twitter)(to_twitter)(quantity));
        };

        ACTION(TwitBotAccount, withdraw) {
            account_name to_eos;

            EOSLIB_SERIALIZE(withdraw, (to_eos));
        };

        static void on(const transfer &transfer) {
            eosio::print("transfering EOS to ", transfer.memo.get_data());
            account existing_account;
            name twitter_name = N(transfer.memo.get_data());
            bool account_exists = accounts::get(twitter_name, existing_account);
            if (account_exists) {
                existing_account.balance = existing_account.balance + transfer.quantity;
                accounts::update(existing_account);
            } else {
                existing_account.twitter_account = twitter_name;
                existing_account.balance = transfer.quantity;
                accounts::store(existing_account);
            }
        };

        static void on(const tip &tip) {
            require_auth(TwitBotAccount);
            eosio::print("tipping EOS to ", tip.to_twitter);
            account account_from;
            account account_to;
            bool account_exists_from = accounts::get(tip.from_twitter, account_from);
            bool account_exists_to = accounts::get(tip.to_twitter, account_to);
            assert(account_exists_from == false, "account does not exist");
            assert(account_from.balance < tip.quantity, "account has not enough balance");

            account_from.balance = account_from.balance - tip.quantity;
            accounts::update(account_from);

            if (account_exists_to) {
                account_to.balance = account_to.balance + tip.quantity;
                accounts::update(account_to);
            } else {
                account_to.twitter_account = tip.to_twitter;
                account_to.balance = tip.quantity;
                accounts::store(account_to);
            }
        };

        static void on(const withdraw &withdraw) {
            eosio::print("withdraw to: ", withdraw.to_eos);
            require_auth(TwitBotAccount);
            account existing_account;
            bool account_exists = accounts::get(withdraw.to_eos, existing_account);
            assert(account_exists == false, "account does not exist");
            existing_account.balance = 0;
            accounts::update(existing_account);
            // TODO: send EOS
            eosio::print("it should send: ", withdraw.to_eos);
        };

        static void apply(account_name code, action_name action) {
            if (!eosio::dispatch<contract, transfer, tip, withdraw>(code, action)) {
                assert(0, "received unexpected action");
            }
        };
    };
}
