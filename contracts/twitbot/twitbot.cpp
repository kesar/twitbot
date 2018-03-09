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

    eosio_assert(transfer.memo.length() > 0, "needs a memo with the name");
    account existing_account;
    name twitter_name = eosio::string_to_name(transfer.memo.c_str());

    if (accounts::exists(twitter_name)) {
        existing_account = accounts::get(twitter_name);
        existing_account.balance = existing_account.balance + transfer.quantity;
        accounts::set(existing_account);
    } else {
        existing_account.twitter_account = twitter_name;
        existing_account.balance = transfer.quantity;
        accounts::set(existing_account);
    }
}

void twitbot::contract::on(const tip &tip) {
    require_auth(code);
    name from_twitter = tip.from_twitter;
    name to_twitter = tip.to_twitter;
    account account_to;

    eosio_assert(accounts::exists(from_twitter), "account does not exist");
    account account_from = accounts::get(from_twitter);
    eosio_assert(account_from.balance >= tip.quantity, "account has not enough balance");

    account_from.balance = account_from.balance - tip.quantity;
    accounts::set(account_from);

    if (accounts::exists(to_twitter)) {
        account_to = accounts::get(to_twitter);
        account_to.balance = account_to.balance + tip.quantity;
        accounts::set(account_to);
    } else {
        account_to.twitter_account = to_twitter;
        account_to.balance = tip.quantity;
        accounts::set(account_to);
    }
}

void twitbot::contract::on(const withdraw &withdraw) {
    require_auth(code);
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
}
