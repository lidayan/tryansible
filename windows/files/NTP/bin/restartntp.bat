@echo off
REM ********** RESTART NTP SERVICE *************
echo Trying to stop NTP service:
net stop ntp
REM Insert a delay ...
echo Wait 10 seconds before restart ...
ping -n 10 127.0.0.1 > NUL
echo Trying to restart NTP service:
net start ntp
pause
