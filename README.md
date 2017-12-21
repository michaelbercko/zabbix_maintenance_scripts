# zabbix_maintenance_scripts
Script for automatic Zabbix maintenance periods 

Install Zabbix-CLI (https://github.com/usit-gd/zabbix-cli):
1. wget https://github.com/usit-gd/zabbix-cl....7.0-1_all.deb
2. apt-get install python-requests python-ipaddr
3. dpkg -i zabbix-cli_1.7.0-1_all.deb

Configure Zabbix-CLI with the Zabbix API URL:
1. zabbix-cli-init --zabbix-url http://<server ip>/zabbix/api_jsonrpc.php

The scripts:
1. add_maintenance.sh
#!/bin/bash
export ZABBIX_USERNAME=<zabbix user>
export ZABBIX_PASSWORD=<zabbix password>
zabbix-cli -C "create_maintenance_definition 'Name-$1' 'Description' '$1' '1 hour' '1'"

2. remove_maintenance.sh
#!/bin/bash
export ZABBIX_USERNAME=<zabbix user>
export ZABBIX_PASSWORD=<zabbix password>
mid=$(zabbix-cli -C "show_maintenance_definitions '*' '*' '$1'" | tail -n 3 | head -n 1 | awk '{print $2}')
zabbix-cli -C "remove_maintenance_definition '$mid'"

Examples:
1. ./add_maintenance.sh pc-name-01
2. ./remove_maintenance.sh pc-name-01
