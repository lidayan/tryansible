
dc.stg.wmcloud.com
dc.xy-inv.wmcloud.com
dc.leitoncapital.wmcloud.com
dc.djs.wmcloud.com
dc.qyinvest.wmcloud.com
dc.tsthamc.wmcloud.com
dc.quantgloballlc.wmcloud.com
gateway.quantgloballlc.wmcloud.com


[all:vars]
ansible_connection=winrm 
ansible_port=5985
ansible_user=Administrator
ansible_password="4rfv$RFV"

