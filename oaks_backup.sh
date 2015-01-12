#!/bin/bash

# Script to backup incremental and important features from the Oaks web directory and others on the server.


# Check to make sure the script is being run as root. 
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
    exit 1
fi



# Allows a little flexibility until I hardcode the ability to designate user 
# 	and others as a string input.
USER=jordan
TIME=$(date +%Y_%m_%d_%H_%M_%S)
BACKUP_SERVER=prowler
BACKUP_NAME='oaks_web_$TIME.tar.gz'


# Make a new home for all of the intermediary files to live. Then go to it.
#	mkdir -p /home/$USER/Oaks
#	cd /home/$USER/Oaks

# Let's start copying and moving directories around. Using tar (gz) to compress and save space. 
tar -zcvf /home/jordan/$BACKUP_NAME /var/www/html/dphoto

# Re-setting permissions because Prowler is a little weird about rooted files coming in. 
chown -R jordan:jordan $BACKUP_NAME

# Secure copy the backup to my main disk server
scp $BACKUP_NAME $USER@$BACKUP_SERVER.student.rit.edu:/mnt/Access1/Oaks

