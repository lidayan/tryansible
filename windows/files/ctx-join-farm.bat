
@echo off

:: initialized variables
set CtxCtlServer=10.23.40.135
set DomainName=datasset
set UserName=yingjun.wang
set UserPass=datayes@123

:: create Dsnfile
echo [ODBC] > mf20.dsn
echo DRIVER=SQL Server >> mf20.dsn
echo DATABASE=MF20 >> mf20.dsn
echo APP=Citrix IMA >> mf20.dsn
echo UID=%UserName% >> mf20.dsn
echo SERVER=%CtxCtlServer%\CITRIX_METAFRAME >> mf20.dsn
echo Trusted_Connection=Yes >> mf20.dsn

:: join to the farm
"%Programfiles(x86)%\Citrix\XenApp\ServerConfig\XenAppConfigConsole.exe" ^
    /log:c:\joinfarm.log ^
    /ExecutionMode:Join ^
    /FarmName:%DomainName%Farm ^
    /DsnFile:mf20.dsn ^
    /AuthenticationType:Sql ^
    /OdbcUsername:%DomainName%.datayes.net\%UserName% ^
    /OdbcPassword:%UserPass% ^
    /LicenseServerName:%CtxCtlServer% ^
    /LicenseServerPort:27000 ^
    /ZoneName:"Default Zone" ^
    /AddAnonymousUsersToRemoteDesktopUserGroup:False ^
    /AddUsersGroupToRemoteDesktopUserGroup:True

if not errorlevel 1 (
    del /f /q mf20.dsn
    echo success
)

:: leave from farm
:: "%Programfiles(x86)%\Citrix\XenApp\ServerConfig\XenAppConfigConsole.exe" /ExecutionMode:Leave

shutdown /r /t 0

