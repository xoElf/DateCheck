@echo off
setlocal
:SyncDateAndTime
cd C:\Windows\System32
cls
net start w32time >nul
cls
W32tm /resync /force >nul
cls

set ExprDate=20010911
::DATE FORMAT YYYYMMDD

for /f "tokens=2 delims==" %%I in (
    'wmic os get localdatetime /format:list ^| find "="'
) do set "now=%%I"

if %now:~0,8% gtr %ExprDate% (
    echo Program has expired.
) else (
	goto more
)
echo.
echo Press any key to exit...
pause >nul
exit

:more
::PUT YOUR CODE HERE!
::EVERYTHING BELOW IS EXAMPLE CODE \/
echo This program is still functional because the expiration date has not been met yet!
echo Congrats!
pause >nul
exit
