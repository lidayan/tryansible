
cd /d D:\backup\userdata
set backdir=%date:~,4%-%date:~5,2%-%date:~8,2%
mkdir %backdir%

set d_str=%date:~5,2%-%date:~8,2%-%date:~,4%

xcopy /d:%d_str% /s /y C:\Share\* .\%backdir%\.

if not errorlevel 1 zip -r %backdir%.zip %backdir%

rmdir /s /q %backdir%