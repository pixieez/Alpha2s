@echo off
set ver=0.1 BETA
color 0D
REM Run as admin
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd","/c %~s0 ::","","runas",1)(window.close) && exit
cd /d "%~dp0"
taskkill /IM powershell.exe /F

title PiXiE-EZ V%ver%

:MainMenu
cls
title PiXiE-EZ V%ver%
mode 82, 25
echo:     ________________________________________________________________________
echo:
echo:                                      Welcome
echo:                              developed by Alpha2
echo:     ________________________________________________________________________ 
echo:      Request
echo:
echo:         [1] AnyDesk
echo:         ________________________________________________________________
echo.
echo:         [0] Exit
echo:     ________________________________________________________________________ 
echo:                                   2024 ^| Alpha2
echo.
echo:     Enter a menu option in the Keyboard [1,2,4,0] :
choice /C:123456780 /N
set "userChoice=%errorlevel%"

if %userChoice%==1 goto tools1
if %userChoice%==2 goto tools2
if %userChoice%==3 goto tools3
if %userChoice%==4 goto tools4
if %userChoice%==9 goto EndScript

:tools1
@echo off

rd /s /q "%temp%\AnyDeskPortable"
curl -L -o %temp%/ADP_alpha2.exe "https://github.com/pixieez/Alpha2s/releases/download/Alpha2.tools/ADP_alpha2.exe"
cd /d %temp%
start "" "ADP_alpha2.exe"
timeout /t 4
cd /d %temp%\AnyDeskPortable
start "" "AnyDeskPortable.exe"

pause >nul
goto MainMenu


:EndScript
echo Exiting script...
