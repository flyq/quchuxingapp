# votequchuxin
# Jungle test net
# Private key: 5Jh7PAVMy1ZuEsuELsEAacecLJd7kogQGCW8NABsDvDcsk9zNwX
# Public key: EOS6d6Hmoipxn5KoEuEGyp7Amo2L5wrJMWFPLn2DFGS9biEe9vC88

# cleos -u http://dev.cryptolions.io:18888 push action eosio buyram '["votequchuxin","votequchuxin","50.0000 EOS"]' -p votequchuxin@active

cleos -u http://dev.cryptolions.io:18888 set contract votequchuxin votequchuxin -p votequchuxin@active

cleos -u http://dev.cryptolions.io:18888 push action votequchuxin init '[""]' -p votequchuxin@active
cleos -u http://dev.cryptolions.io:18888 set account permission votequchuxin active '{"threshold": 1,"keys": [{"key": "EOS6d6Hmoipxn5KoEuEGyp7Amo2L5wrJMWFPLn2DFGS9biEe9vC88","weight": 1}],"accounts": [{"permission":{"actor":"votequchuxin","permission":"eosio.code"},"weight":1}]}' owner -p votequchuxin

cleos -u http://dev.cryptolions.io:18888 push action dacincubator transfer '["ethdofuckeos", "votequchuxin", "10.0000 CPLE", ""]' -p ethdofuckeos@active

cleos -u http://dev.cryptolions.io:18888 push action dacincubator transfer '["ethdofuckeos", "votequchuxin", "10.0000 CPLE", "support"]' -p ethdofuckeos@active
#executed transaction: 1f1617a5ec7ccc09ed39bff6a9db9ba574a93c3aa32f8228967dc8874507157b  136 bytes  1347 us
#  dacincubator <= dacincubator::transfer       {"from":"ethdofuckeos","to":"votequchuxin","quantity":"10.0000 CPLE","memo":"support"}
#  ethdofuckeos <= dacincubator::transfer       {"from":"ethdofuckeos","to":"votequchuxin","quantity":"10.0000 CPLE","memo":"support"}
#  votequchuxin <= dacincubator::transfer       {"from":"ethdofuckeos","to":"votequchuxin","quantity":"10.0000 CPLE","memo":"support"}
#warning: transaction executed locally, but may not be confirmed by the network yet    ] 

cleos -u http://dev.cryptolions.io:18888 get table -l 65536 votequchuxin ethdofuckeos voters
# {
#   "rows": [{
#       "staked": 100000
#     }
#   ],
#   "more": false
# }


cleos -u http://dev.cryptolions.io:18888 push action dacincubator transfer '["ethdofuckeos", "votequchuxin", "10.0000 CPLE", "oppose"]' -p ethdofuckeos@active

cleos -u http://dev.cryptolions.io:18888 get table -l 65536 votequchuxin ethdofuckeos voters
# {
#   "rows": [{
#       "staked": 200000
#     }
#   ],
#   "more": false
# }

cleos -u http://dev.cryptolions.io:18888 get table -l 65536 votequchuxin votequchuxin global
# {
#   "rows": [{
#       "support": 100000,
#       "oppose": 100000,
#       "st": 1542585600,
#       "end": 1542758400
#     }
#   ],
#   "more": false
# }

