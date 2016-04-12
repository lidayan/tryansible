
# # m     h       dom     mon     dow     command
# 1/*     *       *       *       *       /bin/bash zabbixsender4heartbeat.sh > /tmp/heartbeat.log

ZabbixServer="{{ZabbixServer}}"
HeartbeatUrl="{{HeartbeatUrl}}"
hostfqdn="{{ansible_fqdn}}"

# get and send json
item_json=`curl $HeartbeatUrl -s | python -m json.tool`
zabbix_sender -z "$ZabbixServer" -s "$hostfqdn" -k 'application.heartbeat.json' -o "$item_json"

## get and send status
item_status=$(echo $item_json | jq '.status')
zabbix_sender -z "$ZabbixServer" -s "$hostfqdn" -k 'application.heartbeat.status' -o $item_status


