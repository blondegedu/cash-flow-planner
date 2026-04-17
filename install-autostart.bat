@echo off
:: Creates a shortcut in the Windows Startup folder so the server runs on login.
set STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
set FOLDER=%~dp0

:: Write a VBScript to create the shortcut (runs hidden, no console window)
set VBS=%TEMP%\make_shortcut.vbs
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%VBS%"
echo sLinkFile = "%STARTUP%\CashFlowPlanner.lnk" >> "%VBS%"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%VBS%"
echo oLink.TargetPath = "cmd.exe" >> "%VBS%"
echo oLink.Arguments = "/c cd /d ""%FOLDER%"" && py -m http.server 8082" >> "%VBS%"
echo oLink.WorkingDirectory = "%FOLDER%" >> "%VBS%"
echo oLink.WindowStyle = 7 >> "%VBS%"
echo oLink.Save >> "%VBS%"
cscript //nologo "%VBS%"
del "%VBS%"

echo Done! Cash Flow Planner will start automatically on next login.
echo To remove it, delete: %STARTUP%\CashFlowPlanner.lnk
pause
