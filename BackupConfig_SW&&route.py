#!/usr/bin/env python
# -*- coding:utf-8 -*-
from ftplib import FTP
import os,time
import Sendmail

def down_SW(filename,ip,user,pwd,sys_name):
    try:    
	ftp = FTP()
    	ftp.set_debuglevel(2)
    	ftp.connect(ip,'21')
    	ftp.login(user,pwd)
    	bufsize = 1024
    	file_handler = open(filename,'wb').write
    	ftp.retrbinary('RETR %s'%os.path.basename(filename),file_handler,bufsize)
    	ftp.set_debuglevel(0)
    	ftp.close()
    except EOFError:
	ftp.close()
	Sendmail.sendmail(sys_name + 'backup FAILED,error:' + EOFError)
    filename = '%sstartup%s.cfg'%(sys_name,time.strftime('%Y-%m-%d'))
    os.system('mv startup.cfg net_config/startup.cfg')
    os.chdir('net_config')
    os.rename('startup.cfg',filename)
    os.chdir('..')
    #Sendmail.sendmail('Successful to backup switch'+sys_name + 'configuration!')

def down_server(filename,ip,user,pwd,remove_dir,local_dir):
    try:    
	ftp = FTP()
    	ftp.set_debuglevel(2)
    	ftp.connect(ip,'21')
    	ftp.login(user,pwd)
	ftp.cwd(remove_dir)
    	bufsize = 1024
    	file_handler = open(filename,'wb').write
    	ftp.retrbinary('RETR %s'%os.path.basename(filename),file_handler,bufsize)
    	ftp.set_debuglevel(0)
    	ftp.quit()
    except EOFError:
	ftp.close()
	Sendmail.sendmail(ip + 'backup FAILED,error:' + EOFError)
    move_cmd = 'mv ' + filename + ' ' +  local_dir 
    os.system(move_cmd)
    #Sendmail.sendmail('Successful to backup server'+ ip + 'configuration to' +lo_dir)

if __name__ =='__main__':
    hosts = {'SW001':'10.0.7.1','SW002':'10.0.7.2','SW003':'10.0.7.3','SW004':'10.0.7.4','SW005':'10.0.7.5','SW006':'10.0.7.6','SW007':'10.0.7.7','SW008':'10.0.7.8','SW009':'10.0.7.9','SW010':'10.0.7.10','SW011':'10.0.7.11','SW1':'10.0.5.1','SW2':'10.0.5.2'}
    username = ['wenhu.wang','wenhuwang','cootek']
    passwd = ['TDKBw1Glgi4L84Zc7cCs','qwerty','CooTek123']
    wikiname = 'cootek_wiki' + '-' + time.strftime('%Y-%m-%d') + '.sql.gz'
    zabbixname = 'zabbix' + '-' + time.strftime('%Y-%m-%d') + '.sql.gz'    
    filename = ['startup.cfg',wikiname,zabbixname,]
    for sys_name,ip in hosts.items():
        #print sys_name,ip
	down_SW(filename[0],ip,username[0],passwd[0],sys_name)
    
    ser_ip = ['10.0.99.32','10.0.99.199',]
    re_dir = ['/usr/data/mysql/','/data/mysql_backup/',]
    lo_dir = ['/backup/Wiki/mysql/','/backup/zabbix/mysql/',]
    down_server(filename[1],ser_ip[0],username[1],passwd[1],re_dir[0],lo_dir[0])
    down_server(filename[2],ser_ip[1],username[2],passwd[2],re_dir[1],lo_dir[1])
    

