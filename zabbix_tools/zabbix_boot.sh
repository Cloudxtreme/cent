#!/bin/bash
# Headnode script to restart zabbix and agents after a cluster reboot.


 
servers=(
# Put your list of servers here
root@intruder-01.rh.rit.edu
root@intruder-021.rh.rit.edu
root@intruder-031.rh.rit.edu
root@intruder-04.rh.rit.edu
root@intruder-05.rh.rit.edu
root@crawler1.rh.rit.edu
)


for server in ${servers[@]}
do
# Here's the command you're going to run on each
ssh $server 'iptables -F'
ssh $server 'iptables -X'
ssh $server 'service zabbix-agent restart'
done
