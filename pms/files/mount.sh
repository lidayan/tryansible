#!/bin/bash

if [ -z $1 ] || [ -z $2 ] ;then
    echo need 2 params like //dc//backup/app/pms /pms
    exit 1
fi
sharepath="$1"
localpath="$2"


dpkg -l | grep "cifs-utils" > /dev/null
if [ $? -ne 0 ]; then
    curl http://apt.wmcloud.com/install.sh | bash 
    echo Y | apt-get install cifs-utils
fi


## mount disk
if mount | grep "$sharepath" || mount | grep "on $localpath"; then
    echo already mounted the path
else
    [ -d $localpath ] || mkdir $localpath
    mount -t cifs -o username=administrator,password=4rfv\$RFV $sharepath $localpath
fi

## config in fstab
if grep "$sharepath" /etc/fstab || grep " $localpath " /etc/fstab; then
    echo already configed in fstab
else
    echo "$sharepath  $localpath cifs  defaults,username=administrator,password=4rfv\$RFV  0  0" >> /etc/fstab
fi

df -h