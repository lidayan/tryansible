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


################################################# backup for quantbot
bakdir=/datayes/bak.vpc.$(date +%Y%m%d)
[ -d $bakdir ] || mkdir -p $bakdir;

cfgfile="/datayes/vpc-api/etc/settings.py"
[ -f $cfgfile ] && cp $cfgfile $bakdir

mv /datayes/current/vpc-*.deb $bakdir
mv /datayes/current/vpc-client-*.zip $bakdir

username="vpc"
password="vpc"
hostname="db01"
database="vpc"
if ping $hostname -c 2; then
    mysqldump -u$username -p$password -h$hostname $database > $bakdir/vpc.sql
fi


################################################# download pakcages
cd /datayes/current
wget http://artifactory.wmcloud.com/artifactory/f2e-release/com/datayes/vpc-biz/1.16.0-1/vpc-biz-1.16.0-1.deb
wget http://artifactory.wmcloud.com/artifactory/vpc-release/com/datayes/vpc-api/1.16.0-74/vpc-api-1.16.0-74.deb
wget http://artifactory.wmcloud.com/artifactory/vpc-release/com/datayes/vpc-client/1.16.0-2/vpc-client-1.16.0-2-pro.zip 
wget http://artifactory.wmcloud.com/artifactory/quantbot-release/com/datayes/quantbot-api/1.14.0-8/quantbot-api-1.14.0-8.deb
wget http://artifactory.wmcloud.com/artifactory/f2e-release/com/datayes/quantbot-biz/1.14.0-25/quantbot-biz-1.14.0-25.deb

