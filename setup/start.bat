@echo off
setlocal
set PS1_FILE=%~dp0setup-dev.ps1
powershell.exe -ExecutionPolicy Bypass -NoProfile -File "%PS1_FILE%"
endlocal
pause
