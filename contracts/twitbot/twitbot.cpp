#include <eosiolib/eosio.hpp>
#include <eosiolib/currency.hpp>
#include <eosiolib/singleton.hpp>
#include <eosiolib/crypto.h>

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
        eosio_assert(static_cast<uint32_t>(from_act != idx.end()), "must exists from");
        eosio_assert(static_cast<uint32_t>(from_act->balance >= quantity), "must have funds");

        auto to_act = idx.find(account::key(to_twitter));
        if (to_act != idx.end()) { // exists
            idx.modify(to_act, 0, [&](account &act) {
                act.balance = act.balance + quantity;
            });

        } else { // no exist
            accounts.emplace(_self, [&](account &act) {
                act.pkey = accounts.available_primary_key();
                act.twitter_key = account::key(to_twitter);
                act.twitter = to_twitter;
                act.balance = quantity;
            });
        }

        idx.modify(from_act, 0, [&](account &act) {
            act.balance = act.balance - quantity;
        });
    }

    //@abi action
    void withdraw(const string &from_twitter) {
        require_auth(_self);

        auto idx = accounts.template get_index<N(bytwitter)>();
        auto from_act = idx.find(account::key(from_twitter));
        eosio_assert(static_cast<uint32_t>(from_act != idx.end()), "must exists from");
        eosio_assert(static_cast<uint32_t>(from_act->name > 0), "must has name"); // TODO: test this

        action(permission_level{_self, N(active)}, N(eosio.token), N(transfer),
               make_tuple(_self, from_act->name, asset(from_act->balance, S(4, EOS)), string("Twitbot sent"))).send();

        idx.modify(from_act, 0, [&](account &act) {
            act.balance = 0;
        });
    }

    //@abi action
    void claim(const string &from_twitter, const account_name to_eos) {
        require_auth(_self);

        auto idx = accounts.template get_index<N(bytwitter)>();
        auto from_act = idx.find(account::key(from_twitter));
        eosio_assert(static_cast<uint32_t>(from_act != idx.end()), "must exists from");

        idx.modify(from_act, 0, [&](account &act) {
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
        eosio_assert(static_cast<uint32_t>(code == N(eosio.token)), "needs to come from eosio.token");
        eosio_assert(static_cast<uint32_t>(transfer.memo.length() > 0), "needs a memo with the name");
        eosio_assert(static_cast<uint32_t>(transfer.quantity.symbol == S(4, EOS)), "only EOS token allowed");
        eosio_assert(static_cast<uint32_t>(transfer.quantity.is_valid()), "invalid transfer");
        eosio_assert(static_cast<uint32_t>(transfer.quantity.amount > 0), "must bet positive quantity");

        if (transfer.to != _self) {
            return;
        }

        auto idx = accounts.template get_index<N(bytwitter)>();
        auto act = idx.find(account::key(transfer.memo));

        if (act != idx.end()) { // exists
            idx.modify(act, 0, [&](account &act) {
                act.balance = act.balance + transfer.quantity.amount;
            });

        } else { // no exist
            accounts.emplace(_self, [&](account &act) {
                act.pkey = accounts.available_primary_key();
                act.twitter_key = account::key(transfer.memo);
                act.twitter = transfer.memo;
                act.balance = static_cast<uint64_t>(transfer.quantity.amount);
            });
        }
    }

    //@abi table accounts i64
    struct account {
        uint64_t pkey;
        account_name name;
        uint128_t twitter_key;
        string twitter;
        uint64_t balance = 0;

        uint64_t primary_key() const {
            return pkey;
        }

        uint128_t get_twitter_key() const {
            return twitter_key;
        }

        static uint128_t key(const string &string) {
            checksum256 checksum;
            sha256(const_cast<char *>(string.c_str()), string.size(), &checksum);
            return reinterpret_cast<uint128_t *>(checksum.hash)[0];
        }

        EOSLIB_SERIALIZE(account, (pkey)(name)(twitter_key)(twitter)(balance))
    };

    typedef eosio::multi_index<
            N(accounts),
            account,
            eosio::indexed_by<N(bytwitter), eosio::const_mem_fun<account, uint128_t, &account::get_twitter_key>>
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