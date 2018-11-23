#include "exchangetoet.hpp"

void exchangetoet::init() {
    require_auth(_self);    

}  

void exchangetoet::clear() {
    require_auth(_self);
}


void exchangetoet::onTransfer(account_name from, account_name to, extended_asset quantity, string memo){
    if (to != _self) return;
    require_auth(from);

    eosio_assert(quantity.is_valid(), "Invalid token transfer");
    eosio_assert(quantity.amount > 0, "must be a positive amount");

    eosio_assert(quantity.contract == TOKEN_CONTRACT, "must use CPLE to exchange");
    eosio_assert(quantity.symbol == CPLE_SYMBOL, "must use CPLE to exchange");

    struct tx_info tx = {.tx_timestamp = now(), .tx_amount = static_cast<uint64_t>(quantity.amount)};
    singleton_account _account(_self, from);
    auto a = _account.get_or_create(_self, account_info{});

    a.value += quantity.amount;
    a.txs.push_back(tx);

    _account.set(a, _self);
}
