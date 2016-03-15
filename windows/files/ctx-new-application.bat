


$SessionServerName="dayan"
$SessionServerIp=""


Add-PSSnapin Citrix.XenApp.Commands
New-XAApplication `
	-ApplicationType ServerDesktop `
	-ServerNames $servername `
	-DisplayName $servername `
	-BrowserName $servername `
	-Accounts "$SessionServerIp_admin","$SessionServerIp_user"

