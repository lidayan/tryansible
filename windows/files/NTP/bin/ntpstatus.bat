@echo off
REM ********** STATUS OF NTP SERVICE *************
:showstatus
cls
echo Checking current status of NTP service with ntpq -p 
ntpq -p
echo (Auto-Refresh every 10s  --- CTRL+C to Cancel)
ping -n 10 127.0.0.1 > NUL
goto showstatus
