@echo off
set ver=0.1 BETA
color 0D
REM Run as admin
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd","/c %~s0 ::","","runas",1)(window.close) && exit
cd /d "%~dp0"
taskkill /IM powershell.exe /F

title Alpha2-tools V%ver%

:MainMenu
cls
title Alpha2-tools V%ver%
mode 82, 25
echo:     ________________________________________________________________________
echo:
echo:                                      Welcome
echo:                              developed by Alpha2
echo:     ________________________________________________________________________ 
echo:      Request
echo:
echo:         [1] AnyDesk
echo:         [2] WinRAR
echo:         ________________________________________________________________
echo.
echo:         [f] Create Alpha2 folder
echo:         [0] Exit
echo:     ________________________________________________________________________ 
echo:                                   2024 ^| Alpha2
echo.
echo:     Enter a menu option in the Keyboard [1,2,f,0] :
choice /C:123456780f /N
set "userChoice=%errorlevel%"

if %userChoice%==1 goto tools1
if %userChoice%==2 goto tools2
if %userChoice%==3 goto tools3
if %userChoice%==4 goto tools4
if %userChoice%==9 goto EndScript
if %userChoice%==f goto Alpha2Folder

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

:tools2
curl -L -o %temp%/winrar-x64-700.exe "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-700.exe"
curl -L -o %temp%/rarkey.rar "https://github.com/pixieez/WNRAR/releases/download/key2/rarkey.rar"
cd /d %temp%
winrar-x64-700.exe /S
timeout /t 4
start "" "rarkey.rar"

:Alpha2Folder
echo:  please set your path (e.g. : [D:\..\] or etc.)
set /p alpha2_dir="  path:  "
@echo off
cd /d %alpha2_dir%
mkdir .Alpha2
echo [.ShellClassInfo] > .Alpha2\desktop.ini
curl -L -o ./.Alpha2/Alpha2.ico "https://raw.githubusercontent.com/pixieez/Alpha2s/main/Alpha2.ico"
echo IconResource=%CD%\.Alpha2\Alpha2.ico,0 >> .Alpha2\desktop.ini

attrib +s +h .Alpha2\desktop.ini
attrib +s +h .Alpha2\Alpha2.ico
attrib +r .Alpha2

:EndScript
echo Exiting script...
