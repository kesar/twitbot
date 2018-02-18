#include "twitbot.hpp"


extern "C" {
void apply(uint64_t code, uint64_t action) {
    eosio::print("account: ", eosio::name(code), ", act: ", eosio::name(action), "\n");

    if (!eosio::dispatch<
            twitbot::contract,
            twitbot::contract::transfer,
            twitbot::contract::tip,
            twitbot::contract::withdraw>(code, action)) {
        assert(0, "received unexpected action");
    }
}
} // extern

void twitbot::contract::on(const twitbot::contract::transfer &transfer) {
    eosio::print("transfering EOS to ", transfer.memo, "\n");
    account existing_account;
    name twitter_name = string_to_name(transfer.memo.get_data());
    bool account_exists = accounts::get(twitter_name, existing_account);
    if (account_exists) {
        existing_account.balance = existing_account.balance + transfer.quantity;
        accounts::update(existing_account);
    } else {
        existing_account.twitter_account = twitter_name;
        existing_account.balance = transfer.quantity;
        accounts::store(existing_account);
    }
}

void twitbot::contract::on(const tip &tip) {
    require_auth(code);
    eosio::print("tipping EOS to ", tip.to_twitter);
    account account_from;
    account account_to;
    bool account_exists_from = accounts::get(tip.from_twitter, account_from);
    bool account_exists_to = accounts::get(tip.to_twitter, account_to);
    assert(account_exists_from != false, "account does not exist");
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
}

void twitbot::contract::on(const withdraw &withdraw) {
    eosio::print("withdraw to: ", withdraw.to_eos);
    require_auth(code);
    account existing_account;
    name from_twitter = string_to_name(withdraw.from_twitter.get_data());
    bool account_exists = accounts::get(from_twitter, existing_account);
    assert(account_exists != false, "account does not exist");
    eosio::print("it should send ", existing_account.balance, " to: ", existing_account.twitter_account);

    eosio::native_currency::transfer trf;
    trf.from = current_receiver();
    trf.to = withdraw.to_eos;
    trf.quantity = existing_account.balance;
    trf.memo = "From twitbot";
    eosio::action act(permission_level(current_receiver(),N(active)), trf);
    act.send();
    existing_account.balance = 0;
    accounts::update(existing_account);
}

uint64_t twitbot::contract::string_to_name(const char *str) {

    uint32_t len = 0;
    while( str[len] ) ++len;

    uint64_t value = 0;

    for( uint32_t i = 0; i <= 12; ++i ) {
        uint64_t c = 0;
        if( i < len && i <= 12 ) c = char_to_symbol( str[i] );

        if( i < 12 ) {
            c &= 0x1f;
            c <<= 64-5*(i+1);
        }
        else {
            c &= 0x0f;
        }

        value |= c;
    }

    return value;
}


