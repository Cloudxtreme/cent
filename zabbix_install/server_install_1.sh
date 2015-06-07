# Dedicated script to install zabbix server


# Install level 1 dependencies [NO RPM]
sudo yum -y install mysql-server php-xml mysql 

# Install Zabbix RPM files
sudo rpm -ivh http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm

# Intall the rest of the dependencies [FROM RPM]
sudo yum -y install zabbix-server-mysql zabbix-web-mysql 

sudo service mysqld start
sudo chkconfig mysqld on



echo "First stage completed, please configure mySQL"
