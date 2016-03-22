grep pms -r /etc/sudoers.d/
if [ $? -ne 0 ];then
    echo 'pms ALL=(ALL) NOPASSWD:/usr/sbin/service' > /etc/sudoers.d/pms
fi

grep pms /etc/passwd 
if [ $? -ne 0 ]; then
    useradd pms -p'datayes@123' -d /datayes/invest-platform/pms -s /bin/bash
fi


# yes '9ol.(OL>' | passwd root

