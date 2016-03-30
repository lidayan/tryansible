
# # m     h       dom     mon     dow     command
# 1/*     *       *       *       *       /bin/bash zabbixsender4heartbeat.sh > /tmp/heartbeat.log

ZabbixServer="{{ZabbixServer}}"
HeartbeatUrl="{{HeartbeatUrl}}"
hostfqdn="{{ansible_fqdn}}"

# get and send json
item_json=`curl $HeartbeatUrl -s | python -m json.tool`
zabbix_sender -z "$ZabbixServer" -s "$hostfqdn" -k 'application.heartbeat.json' -o "$item_json"

## get and send status
echo $item_json | python -m json.tool | grep -E "^\ {4}\"status\":\ 1"
if [ $? -eq 0 ]; then
    item_status=1
else
    item_status=0
fi
zabbix_sender -z "$ZabbixServer" -s "$hostfqdn" -k 'application.heartbeat.status' -o $item_status


