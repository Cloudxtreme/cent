#!/bin/bash




echo " Installing 'htop'"

wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.i686.rpm
rpm -Uhv rpmforge-release*.rf.i386.rpm
sudo yum -y install htop

echo "Htop install: complete."
