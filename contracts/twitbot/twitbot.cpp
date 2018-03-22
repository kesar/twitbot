#include "twitbot.hpp"

extern "C" {
void apply(uint64_t code, uint64_t action) {

    if (!eosio::dispatch<
            twitbot::contract,
            twitbot::contract::transfer,
            twitbot::contract::tip,
            twitbot::contract::withdraw
    >(code, action)) {
        eosio_assert(0, "received unexpected action");
    }
}
}

void twitbot::contract::on(const twitbot::contract::transfer &transfer) {
    account_index_type accounts(code, code);
    auto account = accounts.find(transfer.from);
    if (account == accounts.end()) {
        eosio::print("Account does not exist. Creating...");
        account = accounts.emplace(code, [&](auto &acc) {
            acc.name = transfer.from;
            acc.balance = transfer.quantity;
        });
    } else {
        eosio::print("Account found. Updating...");
        accounts.modify(account, 0, [&](auto &acc) {
            acc.balance = transfer.quantity + acc.balance;
        });
    }
}

void twitbot::contract::on(const tip &tip) {
    require_auth(code);
/*
    account_index_type accounts(code, code);
    auto idx = accounts.template get_index<N(bytwitter)>();

    // FROM ACCOUNT
    auto key_from = key256::make_from_word_sequence<uint64_t>(eosio::string_to_name(tip.from_twitter.c_str()));
    auto account_from = idx.find(key_from);
    if (account_from == idx.end()) {
        eosio::assert(0, "Account does not exist.");
    } else {
        eosio::print("Account found. Updating...");
        // TODO: Check balance
    }

    // TO ACCOUNT
    auto key_to = key256::make_from_word_sequence<uint64_t>(eosio::string_to_name(tip.to_twitter.c_str()));
    auto account_to = idx.find(key_to);
    if (account_to == idx.end()) {
        eosio::print("Account does not exist. Creating...");
    } else {
        eosio::print("Account found. Updating...");
    } */
}

void twitbot::contract::on(const withdraw &withdraw) {
    require_auth(code);
    /*
    name from_twitter = withdraw.from_twitter;
    eosio_assert(accounts::exists(from_twitter), "account does not exist");
    account existing_account = accounts::get(from_twitter);
    eosio_assert(existing_account.balance > 0, "account has not enough balance");
    eosio::native_currency::transfer trf;
    trf.from = current_receiver();
    trf.to = withdraw.to_eos;
    trf.quantity = existing_account.balance;
    eosio::action act(permission_level(current_receiver(), N(active)), trf);
    act.send();
    existing_account.balance = 0;
    accounts::set(existing_account);
     */
}

void twitbot::contract::on(const claim &claim) {
    require_auth(code);
/*
    account_index_type accounts(code, code);
    auto account = accounts.find(claim.to_eos);
    if (account == accounts.end()) {
        eosio::print("Account does not exist. Creating...");
        account = accounts.emplace(code, [&](auto &acc) {
            acc.twitter = claim.from_twitter;
            acc.name = claim.to_eos;
        });
    } else {
        eosio::print("Account found. Updating...");
        accounts.modify(account, 0, [&](auto &acc) {
            acc.twitter = claim.from_twitter;
            acc.name = claim.to_eos;
        });
    }*/
}
