

winrm set winrm/config/service @{AllowUnencrypted="true"}
winrm set winrm/config/service/auth @{Basic="true"}
winrm set winrm/config/client @{TrustedHosts = "*"}

echo ok


winrm set winrm/config/client @{AllowUnencrypted="true"}

windows tcp portproxy
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=23 connectaddress=192.168.91.28 connectport=22 protocol=tcp