@echo off
call CD %userprofile%\Downloads\
call curl https://test.samtechdatasys.com/soft/Setup/InScribeSetup.msi -O
call curl https://test.samtechdatasys.com/soft/Setup/spark-2-8-0.msi -O
call curl https://test.samtechdatasys.com/soft/Setup/Thunderbird.exe -O
call curl https://test.samtechdatasys.com/soft/Setup/spark.properties -O
call echo Please wait, Inscribe installation is in progress.
call msiexec.exe /i "%userprofile%\Downloads\InScribeSetup.msi" /qn
call echo Inscribe sucessfully installed.
call START "" "C:\Program Files (x86)\InScribe 7\InScribe.exe"
call PowerShell.exe Set-Culture en-us
call echo The reginol format has been EN-US
call echo Please wait, Spark installation is in progress.
call msiexec.exe /i "%userprofile%\Downloads\spark-2-8-0.msi" /qn
call echo Spark Successfully installed
call START "" "C:\Program Files (x86)\Spark\Spark.exe"
call taskkill /im Spark.exe /t /f
call xcopy /s %userprofile%\Downloads\spark.properties %appdata%\Spark /Y
call START "" "C:\Program Files (x86)\Spark\Spark.exe"
call set /p answer= Do you want install Thunderbird ,please type(Y/N)?
if /i "%answer:~,1%" EQU "Y" PowerShell.exe Start-Process -wait -FilePath "%userprofile%\Downloads\Thunderbird.exe" -ArgumentList '/S','/v','/qn'
if /i "%answer:~,1%" EQU "N" del /s /q "%userprofile%\Downloads\spark.properties" "%userprofile%\Downloads\spark-2-8-0.msi" "%userprofile%\Downloads\InScribeSetup.msi" "%userprofile%\Downloads\Thunderbird.exe" "%userprofile%\Downloads\Install-Application.bat"
call START "" "C:\Program Files\Mozilla Thunderbird\thunderbird.exe"
call echo Thunderbird successfully installed.
del /s /q "%userprofile%\Downloads\spark.properties" "%userprofile%\Downloads\spark-2-8-0.msi" "%userprofile%\Downloads\InScribeSetup.msi" "%userprofile%\Downloads\Thunderbird.exe" "%userprofile%\Downloads\Install-Application.bat"
call msg "%username%" Software successfully installed
