#include <eosiolib/eosio.hpp>
#include <eosiolib/currency.hpp>

using namespace eosio;
using namespace std;

class twitbot : public eosio::contract {
public:
    twitbot(action_name self) : contract(self), accounts(_self, _self) {}

    void tip(const string &from_twitter, const string &to_twitter, const uint64_t quantity) {
        require_auth(_self);
        print("Tip");
    }

    void withdraw(const string &from_twitter, const account_name to_eos) {
        require_auth(_self);

        // TODO: check amount

        action(permission_level{_self, N(active)}, N(eosio.token), N(transfer),
               make_tuple(_self, to_eos, 0, string(""))).send();

        // TODO: remove from table amount

        print("withdraw");
    }

    void claim(const string &from_twitter, const account_name to_eos) {
        require_auth(_self);
        print("claim!");
    }

    void apply(const account_name contract, const account_name act) {

        if (act == N(transfer)) {
            _transfer(unpack_action_data<currency::transfer>(), contract);
            return;
        }

        auto &thiscontract = *this;
        switch (act) {
            EOSIO_API(twitbot, (tip)(withdraw)(claim))
        };
    }

    void _transfer(const currency::transfer &transfer, const account_name code) {
        eosio_assert(transfer.memo.length() > 0, "needs a memo with the name");
        print(has_account(transfer.memo));
    }

private:

    //@abi table accounts i64
    struct account {
        account_name name;
        string twitter;
        uint64_t balance = 0;

        account_name primary_key() const { return name; }

        static key256 key(const string &twitter) {
            return key256::make_from_word_sequence<uint64_t>(string_to_name(twitter.c_str()));
        }

        key256 get_key() const { return key(twitter); }

        EOSLIB_SERIALIZE(account, (name)(twitter)(balance))
    };

    typedef eosio::multi_index<N(accounts), account,
            eosio::indexed_by<N(bytwitter), eosio::const_mem_fun<account, key256, &account::get_key> >
    > accounts_index;

    accounts_index accounts;

    bool has_account( const string& twitter) const {
        auto idx = accounts.template get_index<N(bytwitter)>();
        auto itr = idx.find(account::key(twitter));
        return itr != idx.end();
    }
};

extern "C" {
[[noreturn]] void apply(uint64_t receiver, uint64_t code, uint64_t action) {
    auto self = receiver;
    twitbot contract(self);
    contract.apply(code, action);
    eosio_exit(0);
}
}