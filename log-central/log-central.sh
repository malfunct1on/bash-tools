
#!/bin/bash


#get hostname
THISHOST=$(hostname) 

#get script run date
THISDATE=$(date +"%d-%m-%y")

#base dirctory to transfer logs choose whatever u like 
DIRECTORY=/log-center

echo $THISHOST

echo $THISDATE

TEMPDIR=$DIRECTORY/$THISDATE/$THISHOST

echo $TEMPDIR

if [ ! -d "$TEMPDIR" ]; then
mkdir -p $TEMPDIR
fi

for dir in /var/log/*;   
do 
base=$(basename $dir)
echo $base

        if [ ! -d "$dir" ]; then
        echo "$dir is file"
        else
        echo "$dir is directory"
        fi

done












