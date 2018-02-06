#pragma once

#include <eosiolib/eos.hpp>
#include <eosiolib/action.hpp>
#include <eosiolib/dispatcher.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/string.hpp>

using namespace eosio;



namespace twitbot {
class contract {
public:
    static void apply( account_name code, action_name action) {
        //eosio::dispatch<generic_currency, transfer_memo, issue>(c,act);
        eosio::print("account: ", eosio::name(code), ", act: ", eosio::name(action), "\n");

        if (code == N(eosio) && action == N(transfer)) {
            eosio::print("Transfer received!\n");
        }
        else
            eosio::print("not received\n");
    }

//    ACTION( code, transfer ) {
//          account_name from;
//          account_name to;
//          uint64_t     quantity;
//          string       memo;

//          template<typename DataStream>
//          friend DataStream& operator << ( DataStream& ds, const transfer& t ){
//             return ds << t.from << t.to << t.quantity << t.memo;
//          }

//          template<typename DataStream>
//          friend DataStream& operator >> ( DataStream& ds,  transfer& t ){
//             return ds >> t.from >> t.to >> t.quantity >> t.memo;

//          }

//       };
//    };
};





} // namespace

///**
// *  @abi action
// */
//struct withdrawal {
//    account_name to;
//    tokens quantity;
//};

///**
// *  @abi action
// */
//struct tipping {
//    account_name from;
//    account_name to;
//    tokens quantity;
//};

// TODO: add proper db
// using accounts = eosio::table<N(defaultscope),N(currency),N(account),account,uint64_t>;

