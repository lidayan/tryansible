


sc.exe query ntp
if not errorlevel 1 (
    sc.exe stop ntp
    sc.exe delete ntp
)

if exist c:\ntp.zip (
    del /q /f c:\ntp.zip
)
if exist "C:\Program Files (x86)\NTP" (
    rmdir /q /s "C:\Program Files (x86)\NTP"
)

w32tm /config /manualpeerlist:ntp.datayes.net /reliable:yes /update

sc.exe start W32Time