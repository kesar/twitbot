#include "../eoslib/eos.hpp"
#include "../eoslib/token.hpp"
#include "../eoslib/db.hpp"
#include "../eoslib/string.hpp"
#include "../eoslib/types.hpp"

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
        uint64_t quantity;
        const uint8_t memo_length = 0;
    };
/**
 *  @abi action
 */
    struct withdrawal {
        account_name to;
        uint64_t quantity;
    };
/**
 *  @abi table
 */
    struct tipping {
        string account;
        uint64_t quantity;
    };

/**
 *  @abi action
 */
    struct tip {
        string account;
        uint64_t quantity;
    };

    using accounts = table<N(twitbot),N(twitbot),N(tipping),tipping,string>;
}
