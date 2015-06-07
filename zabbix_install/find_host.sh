#!/bin/bash
#
# Jordan Westhoff, RIT 2014
#
# This script does two simple tasks for ZABBIX
#    1) Sets a variable to print the name of the Zabbix server (hardcoded)
#    2) Finds the machines unique hostname and DNS domain name and then concatenates and prints them
#    * This thing is stupid, easy. It's just a pawn for other scripts.



SERVER="Server=cerberus-monitor.com"
FULL=$(hostname).$(dnsdomainname)
echo $SERVER
echo Hostname=$FULL
