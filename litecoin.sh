#!/bin/bash
#create 07/06/2018
#update 30/06/2018

#run in ubuntu 18.04 LTS server 64bits
#https://www.litecoin.info/index.php/Compiling_the_Litecoin_daemon_from_source_on_Debian

#https://bitcointalk.org/index.php?topic=225690.0
#sudo locale-gen en_US en_US.UTF-8 hu_HU hu_HU.UTF-8
#sudo dpkg-reconfigure locales
#https://github.com/pembo210/Litesight-api
#commands
#https://www.kompulsa.com/litecoin-cli-commands/
#mining pool
#https://www.coinsuggest.com/mining-pool-ltc/
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y ntp git build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev libqrencode-dev
sudo apt-get install -y autoconf
sudo apt-get install -y libevent-dev libncurses-dev pkg-config
#sudo apt-get install libqt4-core libqt4-gui libqt4-dev


wget http://miniupnp.free.fr/files/download.php?file=miniupnpc-2.0.tar.gz 
sudo tar -zxf download.php\?file\=miniupnpc-2.0.tar.gz 
cd miniupnpc-2.0
sudo make && sudo make install 
cd .. 
#sudo rm -rf miniupnpc-2.0 download.php\?file\=miniupnpc-2.0.tar.gz

sudo git clone https://github.com/litecoin-project/litecoin

#compiling litecoin
#cd litecoin/src
#sudo make -f makefile.unix USE_UPNP=1 USE_QRCODE=1 USE_IPV6=1

cd litecoin
sudo ./autogen.sh
sudo ./configure --with-incompatible-bdb
#make USE_UPNP=1 USE_QRCODE=1 USE_IPV6=1
sudo make -f Makefile USE_UPNP=1 USE_QRCODE=1 USE_IPV6=1
sudo make install

sudo strip ~/litecoin/src/litecoind

sudo adduser litecoin && sudo adduser litecoin sudo && sudo usermod -g users litecoin && sudo delgroup litecoin sudo chmod 0701 /home/litecoin
sudo strip litecoind
sudo mkdir /home/litecoin/bin
sudo cp ~/litecoin/src/litecoind /home/litecoin/bin/litecoind
sudo chown -R litecoin:users /home/litecoin/bin
#cd
#sudo rm -rf litecoin
su litecoin
sudo ~/litecoin/src/litecoind

echo daemon=1 >> ~/.litecoin/litecoin.conf 
echo rpcuser=litecoin >> ~/.litecoin/litecoin.conf 
echo rpcpassword=litecoin >> ~/.litecoin/litecoin.conf 
#rpcuser=litecoinrpc
#rpcpassword=pickASecurePassword
#rpcport=2300
#daemon=1
#server=1
#gen=1
chmod 0600 ~/.litecoin/litecoin.conf

bin/litecoind


#MSE71vaCxdo4DNzHqUqDAg68tvSCNaQUdE
#exampleusername1
