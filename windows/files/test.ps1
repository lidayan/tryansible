

echo helloboy!


$action = New-ScheduledTaskAction -Execute "Get-Services"
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Saturday -At 02:00
$settings = New-ScheduledTaskSettingsSet -RunOnlyIfIdle  -StartWhenAvailable

Register-ScheduledTask `
    -Action $action `
    -Trigger $trigger `
    -Principal $principal `
    -User administrator `
    -Password ConvertTo-SecureString -String "123456" -AsPlainText -Force `
    -Description "restart computer at saterday 2am" `
    -TaskName "restart-task"
