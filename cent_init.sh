#!/bin/bash

# There is a good deal of required and handy software packages for an initial install of centOS.

clear


read -p "Username:" un




echo " "
echo "The current OS version is:" & cat /etc/redhat-release

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
	rpm -Uhv rpmforge-release*.rf.i386.rpm:wq
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



echo "Install Git"
	sudo yum -y install git
	echo "Git install: complete."
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
	git config user.name "$un"
	sleep 1

	git config user.mail "$un@gmail.com"
	sleep 1

	git config --global credential.helper cache
	sleep 1

	git config --global credential.helper 'cache --timeout=3600'
 
	echo "Git install and configuration: complete."
	echo "WARNING: Git SSH will still need to be manually configured."

#	echo "Moving and cloning necessary scripts repository."
#		cd ..
#		cd ..
#		user=whoami
#		cd /home/$user/Desktop
#		
#		git clone https://github.com/jordanwesthoff/Scripts.git
#		echo "Repo scripts cloned"
		


#	echo "Install VNC, VBox and Vagrant"
#		cd /home/$user/Desktop/Scripts
#		./vagrant_setup.sh	
#	echo "Cluster support install complete"

	echo " "
	echo " "
	echo " "
	echo " "



	echo "Now installing Chromium"
	cd /etc/yum.repos.d
		wget http://people.centos.org/hughesjr/chromium/6/chromium-el6.repo
		sudo yum -y install chromium
	echo "Chromium install complete"




