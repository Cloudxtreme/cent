#!/bin/bash

# Basic script to add EPEL to the node repository

# Get and install EPEL repo for YUM
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm	


# Add the option to enable REMI with the custom REMI file, enabled
cd /etc/yum.repos.d/
rm remi.repo
wget https://raw.githubusercontent.com/jordanwesthoff/cent/master/remi.repo
