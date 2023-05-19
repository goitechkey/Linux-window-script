@echo off
CD %userprofile%\Downloads\
curl https://test.samtechdatasys.com/software-installtion/InScribeSetup.msi -O
curl https://test.samtechdatasys.com/software-installtion/spark_2_8_0.msi -O
curl https://test.samtechdatasys.com/software-installtion/Thunderbird.exe -O
echo Please wait, Inscribe installation is in progress.
msiexec.exe /i "%userprofile%\Downloads\InScribeSetup.msi" /qb!
msg "%username%" Inscribe sucessfully installed.
echo Inscribe sucessfully installed.
echo Please wait, Spark installation is in progress.
msiexec.exe /i "%userprofile%\Downloads\spark_2_8_0.msi" 
echo Spark sucessfully installed
msg "%username%" Spark sucessfully installed
set /p answer= Do you want install Thunderbird ,please type(Y/N)?
if /i "%answer:~,1%" EQU "Y" msiexec.exe /i "%userprofile%\Downloads\Thunderbird.msi" /qb!
if /i "%answer:~,1%" EQU "N" exit /b
msg "%username%" Thunderbird sucessfully installed

