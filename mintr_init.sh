#!/bin/bash


echo "MINTR Install Tool" 
echo "Jordan Westhoff, 2015" 
echo "Tooled for CentOS 6.x" 
echo " "
echo " "


# Check to make sure the user is ROOT or has super user proveleges
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
    exit 1
fi

# CD to SRC, then fetch, unpack and install NODE.JS
cd /usr/src
wget http://nodejs.org/dist/v0.12.2/node-v0.12.2.tar.gz
sleep 2

tar zxf node-v0.12.2.tar.gz
cd node-v0.12.2
./configure
make && make install
sleep 5


# Install NPM as a dependency for Mintr
pkg="npm"
if yum -qq -y install $pkg; then
    echo "Successfully installed $pkg"
else
    echo "Error installing $pkg"
fi


# Install Mintr via NPM
sleep 5
npm install -g mintr
echo "Mintr installed"
npm install 