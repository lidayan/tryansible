
pmshome="/datayes/invest-platform/pms"
if [ ! -d $pmshome ]; then
    exit 0
fi

bakdir=/datayes/bak.$(date +%Y%m%d)
[ -d $bakdir ] || mkdir -p $bakdir;

cfgfile="/datayes/invest-platform/pms/etc/application.conf"
[ -f $cfgfile ] && cp $cfgfile $bakdir

debfile="/datayes/invest-platform/pms*.deb"
test $debfile && mv $debfile $bakdir
if [ $? -ne 0 ]; then
    cp /etc/init.d/pms_s* $bakdir
    cp /datayes/invest-platform/pms/web/pms* $bakdir
fi

if [ $1 ];then
    hostname="$1"
else
    hostname="account01"
fi
username="app_platform"
password="We1come"
database="accountmaster"
if ping $hostname -c 2; then
    mysqldump -u$username -p$password -h$hostname $database > $bakdir/accountmaster.sql
fi


