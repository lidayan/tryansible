
Hostname={{ ansible_fqdn }}

{% if ansible_fqdn.lower().endswith("datayes.net") %}
Server={{ ZabbixServerNet }}
ServerActive={{ ZabbixServerNet }}
{% else %}
Server={{ ZabbixServerCom }}
ServerActive={{ ZabbixServerCom }}
{% endif %}

{% if ansible_fqdn.lower().startswith("dc") %}
HostMetadata=dc
{% else %}
HostMetadata=client
{% endif %}

Timeout=3
