#!/bin/bash
###2:00 executed once every weekend

user=root
psd=CooTek123
backup_dir=/data/mysql_backup
date=`date +%Y%m%d`
old_date=`date +%Y%m%d -d -30days`

###MySQL database backup and delete backup files older than 30 days
  
  if [ ! -d $backup_dir ];then
    mkdir $backup_dir
  fi
  
  cd $backup_dir
   
  find . -mtime +30 -type f | xargs  rm -f &>/dev/null
  #rm -f $old_date.sql* &>/dev/null
  mysqldump -u$user -p$psd --master-data=2 --flush-logs  --lock-all-tables  --all-databases |gzip > $date.sql.gz 

