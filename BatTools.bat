chcp 1252
ECHO OFF
cls

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: meu github https://github.com/felpsfpp                                   ::
:: Programa criado por Doctorwar, feito para ajudar tecnicos de informatica ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

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



:MENU
title BatTools By Doctorwar
echo Menu
echo escolha uma opcao
echo.
echo (1) IpConfig
echo (2) Ping Google
echo (3) Ping Google(sem parar)
echo (4) Reparar Windows
echo (5) Trocar Ip
echo (6) Backup de pasta User
echo (7) 
echo (8) 
echo (9) Sair
echo.
choice /C 123456789 /M "Selecione um numero:"
IF errorlevel=9 goto END
IF errorlevel=8 goto OP8
IF errorlevel=7 goto OP7
IF errorlevel=6 goto OP6
IF errorlevel=5 goto OP5
IF errorlevel=4 goto OP4
IF errorlevel=3 goto OP3
IF errorlevel=2 goto OP2
IF errorlevel=1 goto OP1



:OP1
cls
title ipconfig
ipconfig
pause
goto MENU



:OP2
cls
ping google.com
pause
goto MENU



:OP3
cls
ping google.com /t
goto MENU



:OP4
cls
title Reparador do windows SFC SCANNOW

sfc /scannow
echo.

title Reparador do windows DISM
dism /online /cleanup-image /restorehealth
echo.

title Reparador do windows CHKDSK
chkdsk /r
echo.

choice /C NS /M "Deseja reiniciar o computador agora? Aperte S para reiniciar / aperte N para voltar ao menu"
IF errorlevel=2 goto REINICIAR
IF errorlevel=1 goto MENU
goto MENU



:OP5
cls
title Trocando Ip
ipconfig/flushdns
ipconfig/release
ipconfig/renew
ipconfig/registerdns
pause
goto MENU



:OP6
cls
title User Backup by Doutorwar

echo Em qual disco esta o user que sera copiado? (EX: Disco C) Digite apenas a letra
set/p "diretorio=>"

echo Para qual disco sera copiado o arquivo? (EX: Disco D) Digite apenas a letra
set/p "diretoriof=>"
cd %diretorio%:\Users\
echo Diretorios:
dir /b
echo.
echo Qual o user acima que sera copiado?
set/p "user=>"

@ECHO ON
xcopy "%diretorio%:\Users\%user%" "%diretoriof%:\backup %user% disco %diretorio%" /e /h /c
cls
@ECHO OFF
echo Backup concluido
pause
goto MENU



:OP7
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Private goto FOLDER

:LOCK
ren Private "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Pasta encontrada, iniciando bloqueio
pause
goto MENU

:UNLOCK
echo Pass
set/p "pass=>"
if NOT %pass%== 123 goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Private
echo Pasta desbloqueada
pause
goto MENU

:FAIL
echo Senha Invalida
goto UNLOCK

:FOLDER
echo Pasta nao encontrada, criando pasta no diretorio atual
echo senha padrao: 123
md Private
pause
goto MENU



:OP8
goto MENU


:REINICIAR
shutdown -r -t 5
cls
title REINICIANDO
echo reiniciando em 5 segundos
pause


:END
cls
echo Deseja encerrar o programa?
choice /C SN /M "Aperte  Aperte S para fechar o programa / aperte N para voltar ao menu:"
IF errorlevel=2 goto MENU
IF errorlevel=1 exit
