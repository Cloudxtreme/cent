#!/bin/bash




su

cd /etc/yum.repos.d

wget http://people.centos.org/hughesjr/chromium/6/chromium-el6.repo

yum install chromium
