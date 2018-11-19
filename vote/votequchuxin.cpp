#include "votequchuxin.hpp"

void votequchuxin::init() {
    require_auth(_self);    
    auto g = _global.get_or_create(_self, global{});
    g.support = 0;
    g.oppose = 0;
    g.st = START_TIME;
    g.end = END_TIME;
    _global.set(g, _self); 
}  

void votequchuxin::clear() {
    require_auth(_self);
}

void votequchuxin::unstake(account_name from){
    require_auth(from);

    auto g = _global.get();
    eosio_assert(now() > g.end, "the vote doesn't finish");

    singleton_voters _voters(_self, from);
    auto v = _voters.get_or_create(_self, voter_info{});

    eosio_assert(v.staked > 0, "You don't staked CPLE");

    action(
        permission_level{_self, N(active)}, 
        TOKEN_CONTRACT, N(transfer),
        make_tuple(_self, from, asset(v.staked, TOKEN_SYMBOL), 
            std::string("unstake CPLE")
        )
    ).send();
    
    v.staked = 0;
    _voters.set(v, _self);
}

void votequchuxin::onTransfer(account_name from, account_name to, extended_asset quantity, string memo){
    require_auth(from);

    eosio_assert(to == _self, "Invalid recipient");
    eosio_assert(quantity.is_valid(), "Invalid token transfer");
    eosio_assert(quantity.amount > 0, "must be a positive amount");

    eosio_assert(quantity.contract == TOKEN_CONTRACT, "must use CPLE to vote");
    eosio_assert(quantity.symbol == CPLE_SYMBOL, "must use CPLE to vote");

    auto params = split(memo, ' ');  
    eosio_assert(params.size() >= 1, "Error params amount");

    auto g = _global.get();
    eosio_assert(now() >= g.st && now() <= g.end, "CPLE vote event between at 2018/11/19 8:0:0 (UTC+8 Beijing) and 2018/11/21 8:0:0.");

    if (params[0] == "support") {
        g.support += quantity.amount;
    } else if (params[0] == "oppose") {
        g.oppose += quantity.amount;
    } else {
        eosio_assert( false, "Error params content");
    }

    singleton_voters _voters(_self, from);
    auto v = _voters.get_or_create(_self, voter_info{});

    v.staked += quantity.amount;

    _global.set(g, _self);        
    _voters.set(v, _self);
}
