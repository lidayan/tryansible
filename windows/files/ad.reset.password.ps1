
$ss = ConvertTo-SecureString -String '4rfv$RFV' -AsPlainText -Force

Set-ADAccountPassword -Identity administrator -NewPassword $ss
