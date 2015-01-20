#!/bin/bash

# There is a good deal of required and handy software packages for an initial install of centOS 6.5.
# Script MUST be run as root. If not, will error out. 
# Jordan Westhoff, 2014

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
    exit 1
fi
####################################################

# Set the user sudoers values with the custom sudoers file.
echo "Setting sudoers priveleges"
cd /etc
mv sudoers /home/jordan/Desktop
wget http://logcat.student.rit.edu/Public%20Share/sudoers
mv sudoers.1 sudoers
cd /home/jordan/Desktop
echo "Check sudo..."
sleep 5

sudo yum update
sudo yum -y install openssh-server
sudo service sshd restart
chkconfig sshd on

clear
read -p "Username:" un

# Body of the function
##############################################################
echo " "
echo "The current OS version is:" & cat /etc/redhat-release
sleep 2
echo "This is the standardized (7/11/2014) install setup for a new CentOS box"
echo " "
echo "Install will include htop, 'stress', git, configure git for JW, vnc, virtualbox, vagrant, chromium"
echo "--------------------------------------------------------------------------------------------"
echo " "
sleep 5



echo "Adding EPEL to the repos for additional package support."
sleep 2 

	wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
	wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
	sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm	
	cd /etc/yum.repos.d/
	rm remi.repo
	wget https://raw.githubusercontent.com/jordanwesthoff/cent/master/remi.repo

	echo "REMI databased not updated and activated by default."
	echo "This script replaces default remi file with a new one"
	echo " ==================================================="
	echo " sudo vim /etc/yum.repos.d/remi.repo"
	echo " ==================================================="
	echo " which sets [REMI] to enabled=1 "
	echo " "
	sleep 5
	echo " "
	echo " "
	echo " "
	echo " "


 
echo " "
echo " Installing 'htop'"
	
	wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.i686.rpm
	rpm -Uhv rpmforge-release*.rf.i386.rpm
	sudo yum -y install htop
	echo "Htop install: complete."
	sleep 2
	echo " "
	echo " "
	echo " "
	echo " "



echo "Installing stress"
	sudo yum -y install stress
	echo "Stress intall: complete. "
	sleep 2
	echo " "
	echo " "
	echo " "
	echo " "

echo "Install sysbench"
	sudo yum -y install sysbench
	echo "Sysbench Installed"
	sleep 2
	echo " "

echo "Configure git for: $un"
	git config --global user.name "$un"
	sleep 1
	git config --global user.email "$un@gmail.com"
	sleep 1
	git config --global credential.helper cache
	sleep 1
	git config --global credential.helper 'cache --timeout=3600'
	echo "Git install and configuration: complete."
	echo "WARNING: Git SSH will still need to be manually configured."

	echo "Install VNC, VBox and Vagrant"
	cd /usr/local/bin
	wget https://raw.githubusercontent.com/jordanwesthoff/cent/master/vagrant_setup.sh
	chmod +x vagrant_setup.sh
	./vagrant_setup.sh
	echo "Cluster support install complete"
	echo " "
	echo " "
	echo " "
	echo " "



#	echo "Now installing Chromium"
#	cd /etc/yum.repos.d
#		wget http://people.centos.org/hughesjr/chromium/6/chromium-el6.repo
#		sleep 5
#		sudo yum -y install chromium
#	echo "Chromium install complete"




