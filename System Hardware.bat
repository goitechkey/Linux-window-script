@echo off&setlocal
set "SystemHardware="%userprofile%\desktop\SystemHardware.txt"
(
 systeminfo
wmic cpu get name
)>"%SystemHardware%"            
type "%SystemHardware%" 
