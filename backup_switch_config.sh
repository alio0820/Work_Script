#!/bin/bash

time=`date +%Y_%m_%d`
time_old=`date +%Y_%m_%d -d "+7 day ago"`

find /usr/data/switch_config/ -ctime +90 -exec rm -fr {} \;
###SW001
ftp -n<<!
open 10.0.7.1
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW001_startup$time.cfg
diff /usr/data/switch_config/SW001_startup$time.cfg /usr/data/switch_config/SW001_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW001_startup$time_old.cfg
fi

###SW002
ftp -n<<!
open 10.0.7.2
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW002_startup$time.cfg
diff /usr/data/switch_config/SW002_startup$time.cfg /usr/data/switch_config/SW002_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW002_startup$time_old.cfg
fi

###SW003
ftp -n<<!
open 10.0.7.3
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW003_startup$time.cfg
diff /usr/data/switch_config/SW003_startup$time.cfg /usr/data/switch_config/SW003_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW003_startup$time_old.cfg
fi

###SW004
ftp -n<<!
open 10.0.7.4
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW004_startup$time.cfg
diff /usr/data/switch_config/SW004_startup$time.cfg /usr/data/switch_config/SW004_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW004_startup$time_old.cfg
fi

###SW005
ftp -n<<!
open 10.0.7.5
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW005_startup$time.cfg
diff /usr/data/switch_config/SW005_startup$time.cfg /usr/data/switch_config/SW005_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW005_startup$time_old.cfg
fi

###SW006
ftp -n<<!
open 10.0.7.6
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW006_startup$time.cfg
diff /usr/data/switch_config/SW006_startup$time.cfg /usr/data/switch_config/SW006_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW006_startup$time_old.cfg
fi

###SW007
ftp -n<<!
open 10.0.7.7
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW007_startup$time.cfg
diff /usr/data/switch_config/SW007_startup$time.cfg /usr/data/switch_config/SW007_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW007_startup$time_old.cfg
fi

###SW008
ftp -n<<!
open 10.0.7.8
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW008_startup$time.cfg
diff /usr/data/switch_config/SW008_startup$time.cfg /usr/data/switch_config/SW008_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW008_startup$time_old.cfg
fi

###SW009
ftp -n<<!
open 10.0.7.9
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW009_startup$time.cfg
diff /usr/data/switch_config/SW009_startup$time.cfg /usr/data/switch_config/SW009_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW009_startup$time_old.cfg
fi

###SW010
ftp -n<<!
open 10.0.7.10
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW010_startup$time.cfg
diff /usr/data/switch_config/SW010_startup$time.cfg /usr/data/switch_config/SW010_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW010_startup$time_old.cfg
fi

###SW011
ftp -n<<!
open 10.0.7.11
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW011_startup$time.cfg
diff /usr/data/switch_config/SW011_startup$time.cfg /usr/data/switch_config/SW011_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW011_startup$time_old.cfg
fi

###SW1
ftp -n<<!
open 10.0.5.1
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW1_startup$time.cfg
diff /usr/data/switch_config/SW1_startup$time.cfg /usr/data/switch_config/SW1_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW1_startup$time_old.cfg
fi

###SW2
ftp -n<<!
open 10.0.5.2
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/SW2_startup$time.cfg
diff /usr/data/switch_config/SW2_startup$time.cfg /usr/data/switch_config/SW2_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/SW2_startup$time_old.cfg
fi

###R2
ftp -n<<!
open 10.0.0.254
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/R2_startup$time.cfg
diff /usr/data/switch_config/R2_startup$time.cfg /usr/data/switch_config/R2_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/R2_startup$time_old.cfg
fi

###WAN2
ftp -n<<!
open 101.230.198.97
user wenhu.wang TDKBw1Glgi4L84Zc7cCs
get startup.cfg 
quit
!
mv ./startup.cfg /usr/data/switch_config/WAN2_startup$time.cfg
diff /usr/data/switch_config/WAN2_startup$time.cfg /usr/data/switch_config/WAN2_startup$time_old.cfg
if [ $? == 0  ]
then
	rm -fr /usr/data/switch_config/WAN2_startup$time_old.cfg
fi


