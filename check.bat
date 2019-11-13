REM Ping the web server
http-ping.exe -q -w 5 https://www.baidu1.com
REM http-ping returns the percentage of pings that succeed.
REM With 4 attempts, this can be 0, 25, 50, 75, or 100.
IF %ERRORLEVEL% EQU 0 GOTO failure
IF %ERRORLEVEL% EQU 25 GOTO partialsuccess
IF %ERRORLEVEL% EQU 50 GOTO partialsuccess
IF %ERRORLEVEL% EQU 75 GOTO partialsuccess
IF %ERRORLEVEL% EQU 100 GOTO success

:partialsuccess
echo Partial success!
exit 0
:failure
echo Failed!
exit 1

:success
echo Succeeded!
exit 0