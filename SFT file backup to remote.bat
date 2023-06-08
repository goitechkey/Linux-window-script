@echo off
"C:\Program Files (x86)\WinSCP\WinSCP.com" ^
  /log="C:\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://root:S%%40mt3ch%%24123%%21@192.168.10.10:222/ -hostkey=""ssh-ed25519 255 nyV8m/MAxDPLHWmKp6sgl335cb3y7xRhAWNANsXv+O0"" -rawsettings ProxyPort=0" ^
   "put C:\SystemHardwareDeatils.txt /home/Backup/SystemHardwareDeatils.txt"^
    "exit"

set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
) else (
  echo Error
)

exit /b %WINSCP_RESULT%





@echo off

"C:\Program Files (x86)\WinSCP\WinSCP.com" ^
  /log="C:\writable\path\to\log\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://root:S%%40mt3ch%%24123%%21@192.168.10.10:222/ -hostkey=""ssh-ed25519 255 nyV8m/MAxDPLHWmKp6sgl335cb3y7xRhAWNANsXv+O0"" -rawsettings ProxyPort=0" ^
    "put C:\SystemHardwareDeatils.txt /home/Backup" ^
    "exit"

set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
) else (
  echo Error
)

exit /b %WINSCP_RESULT%
