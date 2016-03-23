

schtasks.exe /create /tn mountonstart /sc onstart /tr "net use U: \\dc\share 4rfv$RFV /user:administrator" /ru administrator /rp 4rfv$RFV /f
schtasks.exe /run /tn mountonstart
