#include <eosiolib/eosio.hpp>
#include <eosiolib/currency.hpp>

using namespace eosio;
using namespace std;

class twitbot : public eosio::contract {
public:
    twitbot(action_name self) : contract(self), accounts(_self, _self) {}

    //@abi action
    void tip(const string &from_twitter, const string &to_twitter, const uint64_t quantity) {
        require_auth(_self);

        auto idx = accounts.template get_index<N(bytwitter)>();
        auto from_act = idx.find(account::key(from_twitter));
        eosio_assert(from_act != idx.end(), "must exists from");
        eosio_assert(from_act->balance >= quantity, "must have funds");

        auto to_act = idx.find(account::key(to_twitter));
        eosio_assert(to_act != idx.end(), "must exists to");

        // TODO: move EOS
    }

    //@abi action
    void withdraw(const string &from_twitter) {
        require_auth(_self);

        auto idx = accounts.template get_index<N(bytwitter)>();
        auto from_act = idx.find(account::key(from_twitter));
        eosio_assert(from_act != idx.end(), "must exists from");

        action(permission_level{_self, N(active)}, N(eosio.token), N(transfer),
               make_tuple(_self, from_act->name, from_act->balance, string("Twitbot sent"))).send();

        idx.modify(from_act, 0, [&](account& act) {
            act.balance = 0;
        });

        print("withdraw");
    }

    //@abi action
    void claim(const string &from_twitter, const account_name to_eos) {
        require_auth(_self);

        auto idx = accounts.template get_index<N(bytwitter)>();
        auto from_act = idx.find(account::key(from_twitter));
        eosio_assert(from_act != idx.end(), "must exists from");

        idx.modify(from_act, 0, [&](account& act) {
            act.name = to_eos;
        });
    }

    void apply(const account_name contract, const account_name act) {

        if (act == N(transfer)) {
            transferReceived(unpack_action_data<currency::transfer>(), contract);
            return;
        }

        auto &thiscontract = *this;
        switch (act) {
            EOSIO_API(twitbot, (tip)(withdraw)(claim))
        };
    }

private:
    void transferReceived(const currency::transfer &transfer, const account_name code) {
        eosio_assert(code == N(eosio.token), "needs to come from eosio.token");
        eosio_assert(transfer.memo.length() > 0, "needs a memo with the name");
        eosio_assert(transfer.quantity.symbol == S(4, EOS), "only EOS token allowed");
        eosio_assert(transfer.quantity.is_valid(), "invalid transfer");
        eosio_assert(transfer.quantity.amount > 0, "must bet positive quantity");

        auto idx = accounts.template get_index<N(bytwitter)>();
        auto act = idx.find(account::key(transfer.memo));

        if (act != idx.end()) { // exists
            idx.modify(act, 0, [&](account& act) {
                act.balance = act.balance + transfer.quantity.amount;
            });

         } else { // no exist
            accounts.emplace(_self, [&](account& act) {
                act.twitter = transfer.memo;
                act.balance = transfer.quantity.amount;
            });
         }
    }

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
};

extern "C" {
void apply(uint64_t receiver, uint64_t code, uint64_t action) {
    auto self = receiver;
    twitbot contract(self);
    contract.apply(code, action);
    eosio_exit(0);
}
}

// EOSIO_ABI(twitbot, (tip)(withdraw)(claim))