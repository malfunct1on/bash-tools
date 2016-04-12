#!/bin/bash


#get hostname
THISHOST=$(hostname) 

#get script run date
THISDATE=$(date +"%d-%m-%y")

#base dirctory
DIRECTORY=/log-center

#log dir
LOGDIR=/var/log

echo $THISHOST

echo $THISDATE

TEMPDIR=$DIRECTORY/$THISDATE/$THISHOST

echo $TEMPDIR

if [ ! -d "$TEMPDIR" ]; then
mkdir -p $TEMPDIR
fi
#move all files older than 7 dayes with name .gz
find $LOGDIR/  -maxdepth 2  -name '*.gz'  -type f -ctime +7 -exec mv '{}' $TEMPDIR/ \;
   
