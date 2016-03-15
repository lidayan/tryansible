

echo helloboy!

Unregister-ScheduledTask -TaskName restart-computer

$action = New-ScheduledTaskAction -Execute "Get-Services"

$trigger = New-ScheduledTaskTrigger `
    -Weekly `
    -WeeksInterval 1 `
    -DaysOfWeek Sunday `
    -At 2am

$settings = New-ScheduledTaskSettingsSet -RunOnlyIfIdle  -StartWhenAvailable

$principal = New-ScheduledTaskPrincipal -LogonType "S4U" -UserId "administrator"

Register-ScheduledTask `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -Principal $principal `
    -User administrator `
    -Password ConvertTo-SecureString -String "123456" -AsPlainText -Force `
    -Description "restart computer at saterday 2am" `
    -TaskName "restart-task"