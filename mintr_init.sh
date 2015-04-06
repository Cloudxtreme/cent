#!/bin/bash


echo "MINTR Install Tool" 
echo "Jordan Westhoff, 2015" 
echo "Tooled for CentOS 6.x" 
echo " "
echo " "



cd /usr/src
wget http://nodejs.org/dist/v0.12.2/node-v0.12.2.tar.gz
sleep 2

tar zxf node-v0.12.2.tar.gz
cd node-v0.12.2
./configure
make && make install