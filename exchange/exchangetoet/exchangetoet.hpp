#pragma once
#include <eosiolib/asset.hpp>
#include <eosiolib/currency.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/singleton.hpp>
#include <eosiolib/transaction.hpp>

#include "config.hpp"

typedef double real_type;

using namespace eosio;

using std::string;

class exchangetoet : public contract {
    public: exchangetoet(account_name self) :
        contract(self),
        _global(_self, _self){}

    // @abi action
    void init();
    // @abi action
    void clear();
    // @abi action
    void onTransfer(account_name from, account_name to,
                    extended_asset quantity, string memo);

    void apply(account_name code, action_name action);

    
    //@abi table accounts
    struct account_info {
        uint64_t value;
    };

    //@abi table global
    struct global {
        uint64_t support;
        uint64_t oppose;
        time st;
        time end;
    };

    typedef singleton<N(global), global> singleton_global;
    singleton_global _global;       

    typedef singleton<N(accounts), account_info> singleton_account;

};


struct st_transfer {
    account_name from;
    account_name to;
    asset        quantity;
    string       memo;
};

void exchangetoet::apply(account_name code, action_name action) {   
    auto &thiscontract = *this;

    if (action == N(transfer)) {
        auto transfer_data = unpack_action_data<st_transfer>();
        onTransfer(transfer_data.from, transfer_data.to, extended_asset(transfer_data.quantity, code), transfer_data.memo);               
        return;
    }

    if (code != _self) return;
    switch (action) {
        EOSIO_API(exchangetoet, (init)(clear));
    };
}

extern "C" {
    [[noreturn]] void apply(uint64_t receiver, uint64_t code, uint64_t action) 
    {
        exchangetoet p(receiver);
        p.apply(code, action);
        eosio_exit(0);
    }
}