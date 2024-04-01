@ECHO OFF
title Reparador do windows by Doctorwar
cls

echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: meu github https://github.com/felpsfpp                                   ::
echo :: Programa criado por Felipe Pinheiro.                                     ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pause
cls

::***************************************************************************
REM  --> Verificando permissao
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> Se o sinalizador der erro, nao tem admin.
if '%errorlevel%' NEQ '0' (
    echo Solicitando privilegios administrativos...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

::***************************************************************************

title SFC scannow
echo Efetuando SFC scannow
sfc /scannow

title DISM
echo Efetuando DISM
dism /online /cleanup-image /restorehealth

title CHKDSK
echo Efetuando CHKDSK
chkdsk /r

:reiniciar2
title CHKDSK Terminou
choice /C NS /M "Deseja reiniciar agora? Aperte S para reiniciar / aperte N para fechar o programa"
IF errorlevel=2 (
    goto REINICIAR )
IF errorlevel=1 (
    goto END)

:REINICIAR
shutdown -r -t 5
cls
echo reiniciando em 5 segundos
pause

:END
