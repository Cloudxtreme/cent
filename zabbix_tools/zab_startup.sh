#!/bin/bash
#
# Jordan Westhoff, RIT 2014
#
# This script is to be set to run on every node after 
# it is rebooted, if it is to be monitored by Zabbix.
# This script does two simple tasks for ZABBIX
#    1) Sets the correct IPTables permissions
#    2) Restarts the zabbix-agent 




# Reboot the network allowances
iptables -F
iptables -X

# Restart Zabbix
service zabbix-agent restart
