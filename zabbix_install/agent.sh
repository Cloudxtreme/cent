#!/bin/bash
#
# Jordan Westhoff, RIT 2014
#
# This script does a number of simple tasks for ZABBIX
#    1) Gathers the RPM repo in order to install Zabbix-Agent
#    2) Installs the agent and its dependencies
#    3) Calls find_host.sh to correctly configure /etc/zabbix/zabbix_agentd.conf 
#    4) Starts and then reboots the zabbix-agent to check for errors in the conf file
#    5) Sets the IPTables correctly and then activates them.


# Check to make sure user is root. If not, fail and return.
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
      exit 1
  fi

# Gather the RPM for Zabbix-Agent
rpm -ivh http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm

# Install Zabbix and the dependencies
yum -y install telnet telnet-server zabbix-agent

# Customize the server setup entries for each machine
./find_host.sh >> /etc/zabbix/zabbix_agentd.conf

# Restart the service
service zabbix-agent restart

# Reset the iptables 
iptables -F
iptables -X
service iptables restart
