#!/bin/bash

# There is a good deal of required and handy software packages for an initial install of centOS 6.5.
# Script MUST be run as root. If not, will error out. 
# Jordan Westhoff, 2014

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
    exit 1
fi
####################################################


############################################################################
# OpenSSH for SSH communication
pkg="openssh-server"
if yum -qq install $pkg; then
    echo "Successfully installed $pkg"
else
    echo "Error installing $pkg"
fi

# Check and Make Sure SSHD is running and then enable it to run at startup
sudo service sshd start
chkconfig sshd on
###########################################################################

clear
read -p "Username:" un
# Body of the function
##############################################################
echo " "
echo "The current OS version is:" & cat /etc/redhat-release
sleep 2

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


############## Installing HTOP ############################################################
echo " "
echo " Installing 'htop'"
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm -Uhv rpmforge-release*.rf.x86_64.rpm
pkg="htop"
	if yum -q -y install $pkg; then
    		echo "Successfully installed $pkg"
	else
    		echo "Error installing $pkg"
	fi
echo "Htop install: complete."
sleep 2
echo " "
echo " "
echo " "
echo " "
##################### Done Installing ##########################################

##################### Install Stress ############################################
echo "Installing stress"
pkg="stress"
	if yum -q -y install $pkg; then
    		echo "Successfully installed $pkg"
	else
    		echo "Error installing $pkg"
	fi
echo "Stress intall: complete. "
sleep 2
echo " "
echo " "
echo " "
echo " "
###################### Done Installing ###########################################



###################### Install Sysbench ##########################################
echo "Install sysbench"
pkg="sysbench"
	if yum -q -y install $pkg; then
    		echo "Successfully installed $pkg"
	else
    		echo "Error installing $pkg"
	fi
	echo "Sysbench Installed"
	sleep 2
	echo " "
#################### Done Installing ##############################################


############### Configure GIT #####################################################
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
############## Done Installing #####################################################

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




