@echo off
title MCVmComputers-NetTools installer for Windows
:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.
  ECHO **************************************
  ECHO Requesting admin...
  ECHO **************************************

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"

  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
:welcome
cls
echo Welcome to the MCVmComputers-NetTools Installer for Windows.
echo.
echo First, please select the RIGHT windows version you are running:
echo.
echo [1] Windows XP
echo.
echo [2] Windows 7
echo.
echo [3] Windows 8
echo.
echo [4] Windows 8.1
echo.
echo [5] Windows 10
echo.
echo [6] Windows 11
echo.
echo [7] Windows Server 2003
echo.
echo [8] Windows Server 2008
echo.
echo [9] Windows Server 2008 R2
echo.
echo [10] Windows Server 2012
echo.
echo [11] Windows Server 2012 R2
echo.
echo [12] Windows Server 2016
echo.
echo [13] Windows Server 2019
echo.
echo [14] Windows Server 2022
echo.
echo.
echo [0] Quit the installer
echo.
set /p ver=Your Windows Version: 
if %ver% == 0 exit
if %ver% == 1 goto xp
if %ver% == 2 goto w7
if %ver% == 3 goto w8
if %ver% == 4 goto w8.1
if %ver% == 5 goto w10
if %ver% == 6 goto w11
if %ver% == 7 goto 2k3
if %ver% == 8 goto 2k8
if %ver% == 9 goto 2k8R2
if %ver% == 10 goto 2k12
if %ver% == 11 goto 2k12R2
if %ver% == 12 goto 2k16
if %ver% == 13 goto 2k19
if %ver% == 14 goto 2k22
goto welcome

:xp
cls
echo Installing for Windows XP...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" set "Arch=x86"
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp0xp\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:w7
cls
echo Installing for Windows 7...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" set "Arch=x86"
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp0w7\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:w8
cls
echo Installing for Windows 8...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" set "Arch=x86"
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp0w8\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:w8.1
cls
echo Installing for Windows 8.1...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" set "Arch=x86"
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp0w8.1\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:w10
cls
echo Installing for Windows 10...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" set "Arch=x86"
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp0w10\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:w11
cls
echo Installing for Windows 11...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" goto welcome
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp0w11\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:2k3
cls
echo Installing for Windows Server 2003...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" set "Arch=x86"
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp02k3\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:2k8
cls
echo Installing for Windows Server 2008...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" set "Arch=x86"
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp02k8\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:2k8R2
cls
echo Installing for Windows Server 2008 R2...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" goto welcome
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp02k8R2\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:2k12
cls
echo Installing for Windows Server 2012...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" goto welcome
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp02k12\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:2k12R2
cls
echo Installing for Windows Server 2012 R2...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" goto welcome
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp02k12R2\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:2k16
cls
echo Installing for Windows Server 2016...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" goto welcome
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp02k16\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:2k19
cls
echo Installing for Windows Server 2019...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" goto welcome
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp02k19\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit

:2k22
cls
echo Installing for Windows Server 2022...
if "%PROCESSOR_ARCHITECTURE%" equ "x86" goto welcome
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=amd64"
pnputil /add-driver "%~dp02k22\%Arch%\netkvm.inf" /install
echo Installation finished!
pause > nul
exit