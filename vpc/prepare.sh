#!/bin/bash


################################################# backup for vpc
bakdir=/datayes/bak.quantbot.$(date +%Y%m%d)
[ -d $bakdir ] || mkdir -p $bakdir;

cfgfile="/datayes/quantbot-api/etc/config.py"
[ -f $cfgfile ] && cp $cfgfile $bakdir

mv /datayes/current/quantbot-*.deb $bakdir
mv /datayes/current/quantbot-agent-*.exe $bakdir

username="quantbot"
password="quantbot"
hostname="db01"
database="quantbot"
if ping $hostname -c 2; then
    mysqldump -u$username -p$password -h$hostname $database > $bakdir/quantbot.sql
fi


## backup for quantbot
bakdir=/datayes
[ -d $bakdir ] || mkdir -p $bakdir;

vpcbakfile=$bakdir/bak.$(date +%Y%m%d).vpc.tar.gz
tar -zcf $vpcbakfile /datayes/vpc-* /etc/nginx/sites-enabled/vpc* /etc/uwsgi/apps-enabled/vpc-api.ini --exclude *.log

username="vpc"
password="vpc"
database="vpc"
hostname="db01"
vpcbaksql=$bakdir/bak.$(date +%Y%m%d).vpc.sql.gz
if ping $hostname -c 2; then
    /opt/mysql/server-5.6/bin/mysqldump -u$username -p$password -h$hostname $database | gzip > $vpcbaksql
fi


qbtbakfile=$bakdir/bak.$(date +%Y%m%d).qbt.tar.gz
tar -zcf $qbtbakfile /datayes/quantbot-* /etc/nginx/sites-enabled/quantbot* /etc/uwsgi/apps-enabled/quantbot-api.ini --exclude *.log

username="quantbot"
password="quantbot"
database="quantbot"
hostname="db01"
qbtbaksql=$bakdir/bak.$(date +%Y%m%d).qbt.sql.gz
if ping $hostname -c 2; then
    /opt/mysql/server-5.6/bin/mysqldump -u$username -p$password -h$hostname $database | gzip > $qbtbaksql
fi



## download pakcages
cd /datayes/current
rm /datayes/current/*.*

vpc_biz_version="1.17.0-3"
vpc_api_version="1.17.0-25"
#vpc_agt_version="1.16.0-1"
wget http://artifactory.wmcloud.com/artifactory/f2e-release/com/datayes/vpc-biz/${vpc_biz_version}/vpc-biz-${vpc_biz_version}.deb
wget http://artifactory.wmcloud.com/artifactory/vpc-release/com/datayes/vpc-api/${vpc_api_version}/vpc-api-${vpc_api_version}.deb
#wget http://artifactory.wmcloud.com/artifactory/vpc-release/com/datayes/vpc-client/${vpc_agt_version}/vpc-client-${vpc_agt_version}-pro.zip 

qbt_biz_version="1.15.0-4"
qbt_api_version="1.15.0-2"
wget http://artifactory.wmcloud.com/artifactory/quantbot-release/com/datayes/quantbot-biz/${qbt_biz_version}/quantbot-biz-${qbt_biz_version}.deb
wget http://artifactory.wmcloud.com/artifactory/quantbot-release/com/datayes/quantbot-api/${qbt_api_version}/quantbot-api-${qbt_api_version}.deb

