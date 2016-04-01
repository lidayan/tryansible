#!/bin/bash

if [ -z $1 ];then
    echo need 2 params like //dc//backup/app/pms
    exit 1
fi
sharepath="$1"

## mount disk
if mount | grep "$sharepath"; then
    umount $sharepath
else
    echo no mountdisk
fi

## config in fstab
if grep "$sharepath" /etc/fstab; then
    grep -v "^$sharepath" /etc/fstab > /etc/fstab.1
    mv -vf /etc/fstab.1 /etc/fstab
else
    echo no mountdisk to remove
fi

df -h