#!/bin/bash
################################################################################
# Original Author:   crombiecrunch
# Fork Author: manfromafar
# Current Author: Xavatar
# Web:     
#
# Program:
#   Install yiimp on Ubuntu 17.10 running Nginx, MariaDB, and php7.1.x
# 
# 
################################################################################
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

    output " "
    output "Updating system and installing required packages."
    output " "

    # update package and upgrade Ubuntu
    sudo apt-get -y update 
    sudo apt-get -y upgrade
    sudo apt-get -y autoremove

    output " "
    output "Switching to Aptitude"
    output " "
    sleep 3
    
    sudo apt-get -y install aptitude
    output " "
    output "Installing Package to compile GETH"
    output " "
    sleep 3
    sudo aptitude -y install git build-essential libgmp3-dev golang screen mc htop nano
    wget https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
    tar -C /usr/local -xzf go1.12.1.linux-amd64.tar.gz
    export GOROOT=/usr/local/go
    export PATH=$GOROOT/bin:$PATH
    export GOPATH=$HOME/go
    output " "
    output "Clone github GETH"
    output " "
    sleep 3
    sudo  git clone https://github.com/hydnoracoin/hora_geth.git
    cd hora_geth
    sudo chmod 0755 build/env.sh
    output " "
    output "Make GETH"
    output " "
    sleep 3
    sudo make geth
    output " "
    output "copy GETH to /usr/bin/"
    output " "
    sleep 3
    sudo cp build/bin/geth /usr/bin/
    cd
    mkdir .hora
    wget https://github.com/hydnoracoin/progminer/releases/download/v1.1.3/genesis.json
    geth --datadir .hora init genesis.json
    output " "
    output "The end please run screen-geth.sh"
    output " "

