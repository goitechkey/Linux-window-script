@echo off
call CD %userprofile%\Downloads\
call curl https://test.samtechdatasys.com/soft/Setup/InScribeSetup.msi -O
call curl https://test.samtechdatasys.com/soft/Setup/spark_3_0_0.msi -O
call curl https://test.samtechdatasys.com/soft/Setup/Thunderbird.exe -O
call curl https://test.samtechdatasys.com/soft/Setup/spark.properties -O
call echo Please wait, Inscribe installation is in progress.
call msiexec.exe /i "%userprofile%\Downloads\InScribeSetup.msi" /qn
call echo Inscribe sucessfully installed.
call PowerShell.exe Set-Culture en-us
call START "" "C:\Program Files (x86)\InScribe 7\InScribe.exe"
call echo Please wait, Spark installation is in progress.
call msiexec.exe /i "%userprofile%\Downloads\spark_3_0_0.msi" /qn
call echo Spark sucessfully installed
call START "" "C:\Program Files (x86)\Spark\Spark.exe"
call taskkill /im Spark.exe /t /f
call xcopy /s %userprofile%\Downloads\spark.properties %appdata%\Spark /Y
call START "" "C:\Program Files (x86)\Spark\Spark.exe"
Call start outlook.exe
call set /p answer= Do you want install Thunderbird ,please type(Y/N)?
if /i "%answer:~,1%" EQU "Y" PowerShell.exe Start-Process -wait -FilePath "%userprofile%\Downloads\Thunderbird.exe" -ArgumentList '/S','/v','/qn'
if /i "%answer:~,1%" EQU "N" exit /b
call START "" "C:\Program Files\Mozilla Thunderbird\thunderbird.exe"
call echo Thunderbird sucessfully installed.
call msg "%username%" Software sucessfully installed
