#!/usr/bin/env python2.7
#coding=utf-8
import json
import urllib2
#xiaorui.cc
url = "http://10.0.99.199/zabbix/api_jsonrpc.php"
header = {"Content-Type": "application/json"}
# request json
data = json.dumps(
{
    "jsonrpc":"2.0",
    "method":"host.create",
    "params":{
        "host": "WAN2","interfaces":
        [{"type": 2,"main": 1,"useip": 1,"ip": "101.230.198.97","dns": "","port": "161"}],
        "groups": [{"groupid": "9"}],"templates": [{"templateid": "10123"}]
        },
    "auth":"ac2828ac1ffb8f057fb74da5a30d5c85",
    "id":1,
}
)
# create request object
request = urllib2.Request(url,data)
for key in header:
    request.add_header(key,header[key])
# get host list
try:
    result = urllib2.urlopen(request)
except URLError as e:
    if hasattr(e, 'reason'):
        print 'We failed to reach a server.'
        print 'Reason: ', e.reason
    elif hasattr(e, 'code'):
        print 'The server could not fulfill the request.'
        print 'Error code: ', e.code
else:
    response = json.loads(result.read())
    result.close()
    print 'ok'
