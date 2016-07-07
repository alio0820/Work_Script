#!/usr/bin/env python
# -*- coding:utf-8 -*-

import smtplib
from email.mime.text import MIMEText
from email.utils import formataddr

def sendmail(content):
    msg = MIMEText(content, 'plain', 'utf-8')
    msg['From'] = formataddr(["王文虎",'wenhu.wang@chule.cc'])
    msg['To'] = formataddr(["IT Alarm",'it-alarm@cootek.cn'])
    msg['Subject'] = "Zabbix mysql backup mail"



    server = smtplib.SMTP("10.0.99.103", 25)
    server.login("wenhu.wang@chule.cc", "CooTek123")
    server.sendmail('wenhu.wang@chule.cc', ['it-alarm@cootek.cn',], msg.as_string())
    server.quit()
