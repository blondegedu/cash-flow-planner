@echo off
:loop
cd /d "%~dp0"
py -m http.server 8082
timeout /t 5 /nobreak >nul
goto loop
