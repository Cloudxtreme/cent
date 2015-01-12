#!/bin/bash

# Script to backup incremental and important features from the Oaks web directory and others on the server.
# Jordan Westhoff, RIT 2015

# Script seeks to accomplish 4 goals, in order
#	1) Check for root, then move to the specified user, create temp_dir
#	2) Find the DPhoto directories, tar them into a tar.gz and copy to temp_dir
#	3) SCP that tar.gz from temp_dir to safe backup_server
# 	4) Clean out the temp folder 

#############################################################################
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
BACKUP_NAME='oaks_HTMLall_$TIME.tar.gz'

# Make a new home for all of the intermediary files to live. Then go to it.
mkdir -p /home/$USER/Oaks_temp
cd /home/$USER/Oaks_temp
mkdir -p other_files
# Let's start copying and moving directories around. Using tar (gz) to compress and save space. 
tar -zcvf  dphoto_$TIME.tar.gz /var/www/html/dphoto
tar -zcvf  wpvaldog_$TIME.tar.gz /var/www/html/wpvaldog
tar -zcvf  wpvaldogtest_$TIME.tar.gz /var/www/html/wpvaldogtest
tar -zcvf  photo_$TIME.tar.gz /var/www/html/photo
tar -zcvf  development_$TIME.tar.gz /var/www/html/development
tar -zcvf  daddyroot.com_$TIME.tar.gz /var/www/html/daddyroot.com
tar -zcvf  wordpress_$TIME.tar.gz /var/www/html/wordpress
tar -zcvf  valdogold_$TIME.tar.gz /var/www/html/valdogold

# There are some extra things that are VERY important so lets copy and tar those
cp /var/www/html/index.html /home/$USER/Oaks_temp/other_files
cp /var/www/html/index.php /home/$USER/Oaks_temp/other_files
cp /var/www/html/linkedin.php /home/$USER/Oaks_temp/other_files
cp /var/www/html/robots.txt /home/$USER/Oaks_temp/other_files
tar -zcvf other_files.tar.gz /home/$USER/Oaks_temp/other_files

# Up a directory for easy sake when binding all 
cd /home/$USER
tar -zcvf $BACKUP_NAME.tar.gz /home/$USER/Oaks_temp
# Re-setting permissions because Prowler is a little weird about rooted files coming in. 
chown -R jordan:jordan $BACKUP_NAME

# Secure copy the backup to my main disk server. Passwordless SSH is only run through
#	my specific user account - not su, so make sure to revert for secure and permissive SSH
su $USER
scp $BACKUP_NAME $USER@$BACKUP_SERVER.student.rit.edu:/mnt/Access1/Oaks >> scp_log.txt


# Sometimes SCP hangs a little at the end when piping to log.
sleep 5


# Let's get rid of the temp shenanigans - saves some space on the machine - don't need three copies
# of copies of copies. ya know.
cd /home/$USER
rm -rf Oaks_temp



