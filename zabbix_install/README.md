### ZABBIX

#### agent.sh
 -> Script to install zabbix on each node to be monitored. This script
    does all but add the correct firewall exception for ZABBIX on port
    10051. This will be added soon once I figure it out. Also correctly 
    configures the /etc/zabbix/zabbix_agentd.conf file using the 
    dependency 'find_host.sh'

#### find_host.sh 
 -> Increddibly simple script to find the current hostname, DNS
    domain name and then concatenate and print the variables. Used
    to correctly configure the /etc/zabbix/zabbix_agentd.conf file.     

#### zab_startup.sh
 -> Script to be run on every single node monitored by zabbix if it is
    restarted or reset. This ensure that zabbix_agent can talk to the
    server once it comes back online. 


----------------------------------------------------------------
#### Adding Nodes to ZABBIX
- SSH to the node and pull the most recent Senior_Thesis folder
- Run ./agent.sh (this installs zabbix-agent and configures the zabbix_agentd.conf file)
- Add {-A INPUT -m state --state NEW -m tcp -p tcp --dport 10051 -j ACCEPT} to the firewall below port 22
- Run {iptables -F}
- Run {iptables -X}
- {service zabbix-agent restart}

The last three steps replicate zab_startup.sh functionality exactly. 

Add these lines to the /etc/zabbix/zabbix_agentd.conf
{
- UserParameter = sensor.core0,sensors | grep -m 1 "Core 0" | awk -F'[^0-9]*' '{print $ 3 }'
- UserParameter = sensor.core0f, sensors -f | grep -m 1 "Core 0" | awk -F'[^0-9]*' '{print $ 3 }'
- UserParameter = sensor.core1,sensors | grep -m 1 "Core 1" | awk -F'[^0-9]*' '{print $ 3 }'
- UserParameter = sensor.core1f, sensors -f | grep -m 1 "Core 1" | awk -F'[^0-9]*' '{print $ 3 }'
}

----------------------------------------------------------------------
#### Zabbix for Windows

1. Go to Logcat > PublicShare and donwload the precompiled Windows binary of Zabbix agent 2.4 for Windows
2. Make a folder on the C: drive named 'zabbix'
3. Extract the contents of the downloaded package to C:\zabbix
4. Edit the .conf file to reflect {server, serverActive} to reflect the Zabbix server
5. Edit the .conf file to reflect {Hostname} to reflect the machine being added
6. Open Windows > Add a Program Exception to the Firewall
7. Add each of the three binaries from the \Bin folder to I/O allowance in the Firewall
8. Run an instance of CMD with admin priveleges
9. Run the command {zabbix_agentd.exe -c C:\zabbix\zabbix_agentd.win.conf -i }
10. Run the command {zabbix_agentd.exe -c C:\zabbix\zabbix_agentd.win.conf -s }
11. Check the Zabbix dashboard to ensure the server has picked up the client. 


http://www.sysads.co.uk/2013/06/deploy-zabbix-agent-monitor-windows-server/
