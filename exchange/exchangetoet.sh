eosiocpp -g ./exchangetoet/exchangetoet.abi ./exchangetoet/exchangetoet.cpp

eosiocpp -o ./exchangetoet/exchangetoet.wast ./exchangetoet/exchangetoet.cpp

cleos -u http://dev.cryptolions.io:18888 set contract exchangetoet exchangetoet -p exchangetoet@active

cleos -u http://dev.cryptolions.io:18888 push action exchangetoet init '[""]' -p exchangetoet@active

cleos -u http://dev.cryptolions.io:18888 push action dacincubator transfer '["ethdofuckeos","exchangetoet","10.0000 CPLE",""]' -p ethdofuckeos@active

cleos -u http://dev.cryptolions.io:38888 get table -l 65536 dacincubator exchangetoet accounts

cleos -u http://dev.cryptolions.io:38888 get table -l 65536 exchangetoet ethdofuckeos accounts

cleos -u http://dev.cryptolions.io:18888 push action dacincubator transfer '["testallthing","exchangetoet","1.0000 CPLE",""]' -p testallthing@active

cleos -u http://dev.cryptolions.io:38888 get table exchangetoet testallthing accounts

cleos -u http://dev.cryptolions.io:18888 push action dacincubator transfer '["testallthing","exchangetoet","3.0000 CPLE",""]' -p testallthing@active

