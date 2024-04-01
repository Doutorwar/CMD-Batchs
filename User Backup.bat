@ECHO OFF
title User Backup by Doctorwar
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

echo Em qual disco esta o user que sera copiado? (EX: Disco C) Digite apenas a letra
set/p "diretorio=>"
cls

echo Para qual disco sera copiado o arquivo? (EX: Disco D) Digite apenas a letra
set/p "diretoriof=>"

cd %diretorio%:\Users\
cls
echo Diretorios:
dir /b
echo.
echo Qual o user acima que sera copiado?
set/p "user=>"
cls

@ECHO ON
xcopy "%diretorio%:\Users\%user%" "%diretoriof%:\backup %user% disco %diretorio%" /e /c
cls

@ECHO OFF
echo Backup concluido
pause
