
$ConnectionBroker = [System.Net.Dns]::GetHostByName((hostname)).HostName
$pfxPassword = ConvertTo-SecureString -String "Datayes12334" -AsPlainText -Force
$PFXFile = "c:/{{TenantName}}.wmcloud.com.pfx"
Set-RDCertificate -Role RDRedirector  -ImportPath $PFXFile -Password $pfxPassword -ConnectionBroker $ConnectionBroker -force
Set-RDCertificate -Role RDPublishing  -ImportPath $PFXFile -Password $pfxPassword -ConnectionBroker $ConnectionBroker -force
Set-RDCertificate -Role RDWebAccess   -ImportPath $PFXFile -Password $pfxPassword -ConnectionBroker $ConnectionBroker -force
Set-RDCertificate -Role RDGateway     -ImportPath $PFXFile -Password $pfxPassword -ConnectionBroker $ConnectionBroker -force
Restart-Service RDMS -Force
Restart-Service TermServLicensing -Force
Restart-Service TScPubRPC -Force 
Restart-Service Tssdis -Force 
Restart-Service TSGateway -Force 
get-rdcertificate