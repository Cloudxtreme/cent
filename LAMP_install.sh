#!/bin/bash

# This script is built for CentOS 6.5

echo "Installing LAMP"
echo "---------------"

su

# Install Apache (httpd) and then start the service
echo "Installing Apache"
  yum -y install httpd
  service httpd start
  sleep 5
echo "Installing Apache Complete"
echo "--------------------------"


# Install MySQL Server; then start the service
echo "Installing MySQL"
  yum -y install mysql-server
  service mysqld start
  


# This is a variable if statement to either run or skip the secure installation
  read -p "Do you want to run the SQL Secure Installation Now? (y/n) \n" yn
      
      case $yn in
        [yYyes]* ) echo "Running secure install \n"; /usr/bin/mysql_secure_installation; break;;
        [nNno]* ) echo "Continuing install \n"
      esac
  sleep 5
echo "Installing MySQL Complete"
echo "--------------------------"


# INSTALL PHP 
echo "Installing PHP and all modules"
  yum -y install php php-mysql
  yum -y install php-* # This installs all available modules
  echo "Installing PHP Complete"
echo "--------------------------"
  