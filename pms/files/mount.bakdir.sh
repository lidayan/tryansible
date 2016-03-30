#!/bin/bash

dpkg -l | grep "cifs-utils" > /dev/null
if [ $? -ne 0 ]; then
    curl http://apt.wmcloud.com/install.sh | bash 
    echo Y | apt-get install cifs-utils
fi

if [ -z $1 ];then
    echo need fisrt param as sharepath like //dc//backup/app/pms
    exit 1
fi
localpath=/$(basename $1)
sharepath="$1"

[ -d $localpath ] || mkdir $localpath
mount | grep "$sharepath" > /dev/null
if [ $? -ne 0 ]; then
    mount -t cifs -o username=administrator,password=4rfv\$RFV $sharepath $localpath
fi

grep "$sharepath" /etc/fstab > /dev/null
if [ $? -ne 0 ];then
    echo "$sharepath  $localpath cifs  defaults,username=administrator,password=4rfv\$RFV 0  0" >> /etc/fstab
fi
