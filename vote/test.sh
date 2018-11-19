# votequchuxin
# Jungle test net
# Private key: 5Jh7PAVMy1ZuEsuELsEAacecLJd7kogQGCW8NABsDvDcsk9zNwX
# Public key: EOS6d6Hmoipxn5KoEuEGyp7Amo2L5wrJMWFPLn2DFGS9biEe9vC88

# cleos -u http://dev.cryptolions.io:18888 push action eosio buyram '["votequchuxin","votequchuxin","50.0000 EOS"]' -p votequchuxin@active

cleos -u http://dev.cryptolions.io:18888 set contract votequchuxin votequchuxin -p votequchuxin@active

cleos -u http://dev.cryptolions.io:18888 push action votequchuxin init '[""]' -p votequchuxin@active
