# Initialization script to bring up a Digital Ocean host












# Body of the function

#########################################
pkg="mysql"
if yum -qq install $pkg; then
    echo "Successfully installed $pkg"
else
    echo "Error installing $pkg"
fi
#########################################

#########################################
pkg="mysql-server"
if yum -qq install $pkg; then
    echo "Successfully installed $pkg"
else
    echo "Error installing $pkg"
fi
#########################################

#########################################
pkg="php-xml"
if yum -qq install $pkg; then
    echo "Successfully installed $pkg"
else
    echo "Error installing $pkg"
fi
#########################################

#########################################
pkg="mysql"
if yum -qq install $pkg; then
    echo "Successfully installed $pkg"
else
    echo "Error installing $pkg"
fi
#########################################





echo "Set HTTPD to start on boot."
sudo chkconfig httpd on

echo "Set MySQLd to start on boot."
sudo chkconfig mysqld on

echo "Set OpenSSH to start on boot."
sudo chkconfig openssh-server on
