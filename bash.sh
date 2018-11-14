cleos -u http://dev.cryptolions.io:18888 push action eosio buyram '["dacincubator","dacincubator","100.0000 EOS"]' -p dacincubator@active

cleos -u http://dev.cryptolions.io:38888 set contract dacincubator dacincubator -p dacincubator@active
cleos -u http://dev.cryptolions.io:18888 push action dacincubator init '[]' -p dacincubator


cleos -u http://dev.cryptolions.io:38888 get table -l 65536 dacincubator quchuxingapp accounts

cleos -u http://dev.cryptolions.io:18888 push action eosio buyram '["quchuxingapp","quchuxingapp","100.0000 EOS"]' -p quchuxingapp@active


cleos -u http://dev.cryptolions.io:18888 set contract quchuxingapp quchuxingapp -p quchuxingapp@active

cleos -u http://dev.cryptolions.io:18888 push action quchuxingapp init '[]' -p quchuxingapp


cleos -u http://dev.cryptolions.io:18888 push action eosio.token transfer '["ethdofuckeos","quchuxingapp","10.0000 EOS",""]' -p ethdofuckeos@active


cleos -u http://dev.cryptolions.io:18888 push action eosio.token transfer '["ethdofuckeos","dacincubator","10.0000 EOS",""]' -p ethdofuckeos@active
cleos -u http://dev.cryptolions.io:38888 push action eosio.token transfer '["ethdofuckeos","quchuxingapp","10.0000 EOS",""]' -p ethdofuckeos@active
cleos -u http://dev.cryptolions.io:18888 push action eosio.token transfer '["ethdofuckeos","quchuxingapp","10.0000 EOS",""]' -p ethdofuckeos

cleos set account permission quchuxingapp active '{"threshold": 1,"keys": [{"key": "EOS7wT9ZGfdHree9R4QzhquLKwMQAgiVay8YaGQx9x4PcUcx9ZiCz","weight": 1}],"accounts": [{"permission":{"actor":"quchuxingapp","permission":"eosio.code"},"weight":1}]}' owner -p quchuxingapp