

schtasks /create /f /tn restart-computer `
    /ru administrator /rp '4rfv$RFV' `
    /tr "shutdown /r /t 1" `
    /sc weekly /d sat /st 23:59

