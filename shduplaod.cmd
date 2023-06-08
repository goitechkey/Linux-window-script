@echo off

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
exit /b %WINSCP_RESULT%