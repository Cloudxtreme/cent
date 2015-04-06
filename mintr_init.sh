#!/bin/bash


echo "MINTR Install Tool" 
echo "Jordan Westhoff, 2015" 
echo "Tooled for CentOS 6.x" 
echo " "
echo " "

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
    exit 1
fi

cd /usr/src
wget http://nodejs.org/dist/v0.12.2/node-v0.12.2.tar.gz
sleep 2

tar zxf node-v0.12.2.tar.gz
cd node-v0.12.2
./configure
make && make install

sleep 5


# Install NPM
pkg="npm"
if yum -qq -y install $pkg; then
    echo "Successfully installed $pkg"
else
    echo "Error installing $pkg"
fi