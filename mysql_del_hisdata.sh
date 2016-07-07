#!/bin/bash


user=root
psd=CooTek123
date_old=`date +%s -d "20 day ago"`
sock_dir=/data/mysql/mysql.sock

###Delete mysql database of historical data 14 days ago 

mysql -u$user -p$psd -S$sock_dir -e  "
use zabbix;
delete from history_uint where clock < '$date_old';
delete from history where clock < '$date_old';
optimize table history_uint;
optimize table history;
notee;
quit"








