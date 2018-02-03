#include <eoslib/eos.hpp>
#include <eoslib/token.hpp>
#include <eoslib/db.hpp>

#ifndef TWITBOT
#define TWITBOT twitbot
#endif

namespace TWITBOT {
    using namespace eosio;

/**
 *  @abi action
 */
    struct transfer {
        static const uint64_t action_type = N(transfer);
        account_name from;
        account_name to;
        tokens quantity;
        const uint8_t memo_length = 0;
    };

    struct withdrawal {
        account_name to;
        tokens quantity;
    };

    struct tipping {
        account_name from;
        account_name to;
        tokens quantity;
    };

    // TODO: add proper db
    // using accounts = eosio::table<N(defaultscope),N(currency),N(account),account,uint64_t>;
}
