#!/bin/bash

output() {
    printf "\E[0;33;40m"
    echo $1
    printf "\E[0m"
}

displayErr() {
    echo
    echo $1;
    echo
    exit 1;
}
IP=`ip addr list eth0 | grep "  inet " | head -n 1 | cut -d " " -f 6 | cut -d / -f 1`
RPCPORT="18504"
screen -dmS geth geth --datadir .hora  --rpc --rpcaddr "0.0.0.0" --rpcport "$RPCPORT" --networkid 19783111 --syncmode 'full' --rpcapi "admin,db,eth,miner,net,txpool,personal,web3" console

output " "
output "You Node Address: http://$IP:$RPCPORT"
output " "
