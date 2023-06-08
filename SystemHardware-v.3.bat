@echo off&setlocal
echo ************************
echo DO NOT CLOSE THIS WINDOW
mkdir c:\shd
cd c:\shd
curl.exe https://webwerks.dl.sourceforge.net/project/winscp/WinSCP/6.1/WinSCP-6.1.msi -O
call msiexec.exe /i "c:\shd\WinSCP-6.1.msi" /qn
call set "SystemHardware="c:\shd\shd_%computername%.txt"
(
systeminfo | findstr /C:"Host Name"
systeminfo | findstr /C:"OS Name"
systeminfo | findstr /C:"OS Version"
systeminfo | findstr /C:"Product ID"
systeminfo | findstr /C:"Original Install Date"
systeminfo | findstr /C:"System Manufacturer"
systeminfo | findstr /C:"System Model"
systeminfo | findstr /C:"System Type"
wmic cpu get name
systeminfo | findstr /C:"Total Physical Memory"
powershell "get-physicaldisk | format-table -autosize"
getmac /v /fo list | findstr /C:"Physical Address"
tracert -h 1 google.com
nslookup exit /b
)>"%SystemHardware%"            
type "%SystemHardware%" 
cscript C:\Windows\System32\slmgr.vbs /dli > c:\shd\wad_%computername%.txt
"C:\Program Files (x86)\WinSCP\WinSCP.com" ^
  /log="C:\WinSCP.log" /ini=nul ^
  /command ^
    "open ftpes://images%%40samtechdatasys.in:abc%%4012345@mail.samtechdatasys.in:1222/ -rawsettings ProxyPort=0" ^
   "put C:\shd\*.txt /SystemHarwareDeatils/*.txt" ^
    "exit"

set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
) else (
  echo Error
)
cd c:\
rmdir /s /q shd
exit /b %WINSCP_RESULT%
