#include "exchangetoet.hpp"

void exchangetoet::init() {
    require_auth(_self);    

}  

void exchangetoet::clear() {
    require_auth(_self);
}


void exchangetoet::onTransfer(account_name from, account_name to, extended_asset quantity, string memo){
    require_auth(from);

    eosio_assert(to == _self, "Invalid recipient");
    eosio_assert(quantity.is_valid(), "Invalid token transfer");
    eosio_assert(quantity.amount > 0, "must be a positive amount");

    eosio_assert(quantity.contract == TOKEN_CONTRACT, "must use CPLE to exchange");
    eosio_assert(quantity.symbol == CPLE_SYMBOL, "must use CPLE to exchange");



    singleton_account _account(_self, from);
    auto a = _account.get_or_create(_self, account_info{});

    a.value += quantity.amount;

    _account.set(a, _self);
}
