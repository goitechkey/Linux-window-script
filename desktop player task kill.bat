Taskkill /IM DesktopPlayer.exe /F
NET stop "Citrix DesktopPlayer Mepd Service"
echo deleting file
del "%UserProfile%\.VirtualBox\virtualbox.xml"
NET start "Citrix DesktopPlayer Mepd Service"
exit