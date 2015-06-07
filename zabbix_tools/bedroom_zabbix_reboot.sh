#!/bin/bash

# Check to ensure the session is root
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
    exit 1
fi

# Run the ansible command to ensure that Zabbix-agent is running
ansible bedroom -m shell -a "cd /home/jordan/Desktop/GitHub/senior_thesis && ./zab_startup"
