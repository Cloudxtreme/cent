#!/bin/bash


user="jordan"

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
    exit 1
fi
################

yum -y install openssh-server gcc make kernel-devel
yum -y install dkms binutils patch libgomp glibc-headers glibc-devel kernel-headers
yum -y update
yum -y install git




cd /home/$user/Desktop
mkdir -p GitHub
cd /GitHub
git clone https://github.com/jordanwesthoff/cent
git clone https://github.com/jordanwesthoff/senior_thesis
cd /home/$user/Desktop

chown -R jordan:jordan /home/$user/Desktop/GitHub



mkdir /mnt/SLURM
