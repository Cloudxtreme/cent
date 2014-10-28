#!/bin/bash

echo "You must be ROOT"
echo " "
echo " "
echo "___________________________________________"

echo "Setting up Vagrant"
echo " "
echo "Vagrant Requires VNC, setting that up first."

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
      exit 1
fi


  sudo yum -y install vnc-server &&
	echo "VNC Server Installed"
	echo " "
  sudo yum -y install tigervnc-server &&
  	echo "Tiger VNC Instaled"
	echo " "
  sudo yum -y install vnc
	echo " VNC installed"
	echo " "
  sudo yum -y groupinstall Desktop
  sudo yum -y install xterm
	echo "XTerm installed"
	echo " "
	echo " "
	echo "Killing yum to continue"
	sudo pkill /var/run/yum.pid
  
echo "VNC install complete"
echo "------------------------------------------"
echo ""
echo " Vagrant Requires VirtualBox, setting that up next"

  cd /etc/yum.repos.d
  sudo wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
  
  
  sudo wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.i686.rpm
  sudo rpm -Uvh rpmforge-release-0.5.2-2.el6.rf.i686.rpm
  sudo wget http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt
  sudo rpm --import RPM-GPG-KEY.dag.txt
  
	sudo pkill /var/run/yum.pid

  sudo yum -y --enablerepo=rpmforge install aria2
  sudo yum -y --enablerepo rpmforge install dkms
  
	sudo pkill /var/run/yum.pid

  sudo yum -y groupinstall "Development Tools"
  sudo yum -y install kernel-devel
  sudo yum -y install VirtualBox-4.1
  
echo "Virtual Box install complete"
echo "-------------------------------------------"
echo "Vagrant Requires Vagrant (duh), setting that up now"

  sudo wget https://dl.dropboxusercontent.com/u/6188180/vagrant_1.6.3_i686.rpm
  sudo rpm -i vagrant_1.6.3_i686.rpm



clear
echo "Setup Complete (VNC, VBox and VagrantUP)"
echo "----------------------------------------"
echo "In order to begin using Vagrant, cd and make a directory where you wish called Vagrant"
echo "Then use the 'vagrant init' command to invoke and load a pre-specified OS"
echo "Here are some general ones to begin with:"
echo " "
echo "         OS                 |      Name"
echo "----------------------------|--------------------------"
echo "   Cent OS 6.5 x64          |  chef/cebtos-6.5         "
echo "   Debian 7.4 x64           |  chef/debian-7.4         "
echo "   Ubuntu 12.04 LTS 64 Bit  |  hashicorp/precise64     "
echo "   Ubuntu 12.04 LTS 32 Bit  |  hashicorp/precise32     "
echo "-------------------------------------------------------"
echo " "
echo "Then the command 'vagrant up' can be used. Vagrant will download and init the box."




