set -eux

# # m     h       dom     mon     dow     command
# 30      0       *       *       *       /bin/bash -x /root/scripts/backup_accountmaster.sh > /tmp/backaccount.log 2>&1

PATH=$PATH:/opt/mysql/server-5.6/bin

user='{{accountmaster.user}}'
password='{{accountmaster.pass}}'
hostname='{{accountmaster.host}}'
dbname='accountmaster'

backdir='{{pmsbakdir}}'
[ -d $backdir ] || mkdir $backdir

# dump database
sqlgzip="$backdir/${dbname}_`date +%Y%m%d%H%M`.sql.zip"
mysqldump --quick  --single-transaction -u$user -p"$password" -h $hostname  $dbname | gzip > $sqlgzip

# delete older files
find $backdir -name "$dbname*.sql.*" -ctime +4 -delete
