#!/usr/bin/env python
# -*- coding:utf-8 -*-
import os
import time
import datetime
from stat import *
import Sendmail
import time

user = 'root'
passwd = 'CooTek123'
mysqlcmd = '/usr/bin/mysqldump'
gzipcmd = '/bin/gzip'
mysqldb = ['zabbix',]
tobakdir = '/data/mysql_backup/'
now_time = time.strftime("%Y-%m-%d %H:%M:%S",time.localtime(time.time()))
#backup mysql database
for db in mysqldb:
    backfile = tobakdir + db + '-' + time.strftime('%Y-%m-%d') + '.sql'
    gzfile = backfile + '.gz'
    if os.path.isfile(gzfile):
        print now_time +'\n' + gzfile + 'is already backup!'
	Sendmail.sendmail(now_time +'\n' + gzfile + 'is already backup')	
    else:
        back_cmd = mysqlcmd + ' -u' + user + ' -p' + passwd + ' ' + db + ' >' + backfile
	if os.system(back_cmd)==0:
            print now_time +'\n' + 'Success backup to', db +  'to' + backfile
	    Sendmail.sendmail(now_time +'\n' + 'Successful backup to'+ backfile)
            gzip_cmd = gzipcmd + ' ' + backfile
            if os.system(gzip_cmd)==0:
                print now_time +'\n' + 'Successful Gzip to',gzfile
	        Sendmail.sendmail(now_time +'\n' + 'Successful backup and gzip to'+ gzfile)
            else:
                print now_time +'\n' + 'Gzip FAILED!!!'
	        Sendmail.sendmail(now_time +'\n' + 'Gzip FAILED!!!')
        else:
            print now_time +'\n' + 'Backup FAILED!!!'
	    Sendmail.sendmail(now_time +'\n' + 'Backup FAILED!!!')


#delete backup file
filelist = []
filelist = os.listdir(tobakdir)
for i in range(len(filelist)):
    ft = time.gmtime(os.stat(tobakdir+filelist[i])[8])
    ftl=time.strftime('%Y-%m-%d',ft)
    year,month,day=ftl.split('-')
    ftll=datetime.datetime(int(year),int(month),int(day))
    localt=time.gmtime()
    localtl=time.strftime('%Y-%m-%d',localt)
    year,month,day=localtl.split('-')
    localtll=datetime.datetime(int(year),int(month),int(day))
    days=(localtll-ftll).days
    if days >90:
        try:
            os.remove(tobakdir+filelist[i])
	    Sendmail.sendmail('delete is ok!')
        except:
            log=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')+" remove "+tobakdir+filelist[i]+" fail \n"
	    Sendmail.sendmail(log)


