

winrm set winrm/config/service @{AllowUnencrypted="true"}
winrm set winrm/config/client @{TrustedHosts = "*"}

echo ok
