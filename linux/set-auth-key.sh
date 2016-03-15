
thedir="/root/.ssh"
thefile="$thedir/authorized_keys"
[ ! -d $thedir ] && mkdir -p $thedir
[ ! -f $thefile ] && touch $thefile;

grep "dayan@ubuntu" $thefile
if [ $? -ne 0 ];then
    echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCv+kYN0NjhP0hUGjcpP5rosx9QUl8zh+bU4Mp0dfG+URzxhkLXzAdm6s4DER+X2NN0+Qs/wB636e/iTPCNj26E+TZXVmnPNc+ENJYC3M/yFwxqSU2m/J/k4UDiUA1dWpHw+fq20woCRUrQzuGIslfw6NofOtcrc5GvLd4+Ky1qt7JlNihP92s6AIf3QSYboQUfjaFoKyr0jpq6jiJvyxPmDeGYaA59jyuctLUS7ew46h2EezRoUkSFwv75SV1a3Nw0DzOrDSN6HedASoiHYAjKG3gX9XSnTIp/SZlq96ApldkgFiPzhejuGmjtGnsBrb5gbuUhZYHAsqLirtPCAF15 dayan@ubuntu >> $thefile
fi

echo ok