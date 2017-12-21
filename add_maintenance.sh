#!/bin/bash
export ZABBIX_USERNAME=<user>
export ZABBIX_PASSWORD=<password>
zabbix-cli -C "create_maintenance_definition 'Name-$1' 'Description' '$1' '1 hour' '1'"