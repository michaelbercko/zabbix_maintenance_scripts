#!/bin/bash
export ZABBIX_USERNAME=<user>
export ZABBIX_PASSWORD=<password>
mid=$(zabbix-cli -C "show_maintenance_definitions '*' '*' '$1'" | tail -n 3 | head -n 1 | awk '{print $2}')
zabbix-cli -C "remove_maintenance_definition '$mid'"