
thefile=/etc/profile

grep "HISTTIMEFORMAT" $thefile
if [ $? -ne 0 ];then
    echo 'HISTTIMEFORMAT="%F %T `whoami` "' >> /etc/profile
fi

echo success
