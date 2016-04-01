
[dc]
dc.stg.wmcloud.com
dc.xy-inv.wmcloud.com
dc.leitoncapital.wmcloud.com
dc.djs.wmcloud.com
dc.idataq.wmcloud.com
dc.quantgloballlc.wmcloud.com
dc.qyinvest.wmcloud.com

[gateway]
gateway.djs.wmcloud.com
gateway.quantgloballlc.wmcloud.com

[desktop]                                                 
client01.leitoncapital.wmcloud.com ansible_host=10.22.76.5
client02.leitoncapital.wmcloud.com ansible_host=10.22.76.4  

[all:vars]
ansible_connection=winrm 
ansible_port=5985
ansible_user=Administrator
ansible_password="4rfv$RFV"

