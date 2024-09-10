ECHO OFF
cls

echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: meu github https://github.com/felpsfpp                                   ::
echo :: Programa criado por Felipe Pinheiro.                                     ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pause
cls

::***************************************************************************
REM  --> Verificando permissao
    if "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
        >nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
    ) else (
        >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system")

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
cls
title BatTools By Doctorwar

    	echo Menu
    	echo escolha uma opcao
    	echo.
    	echo (1) IpConfig
    	echo (2) Ping Google
    	echo (3) Ping Google (sem parar)
    	echo (4) Reparar Windows
    	echo (5) Reparar Windows (sem check disk, nao reinicia)
    	echo (6) Backup de pasta User
    	echo (7) Limpar cache DNS
    	echo (8) Menu 2
    	echo (9) Sair
    	echo.
    	choice /C 123456789 /M "Selecione um numero:"
    		IF errorlevel=9 goto END
    		IF errorlevel=8 goto MENU2
    		IF errorlevel=7 goto OP7
    		IF errorlevel=6 goto OP6
    		IF errorlevel=5 goto OP5
    		IF errorlevel=4 goto OP4
    		IF errorlevel=3 goto OP3
    		IF errorlevel=2 goto OP2
    		IF errorlevel=1 goto OP1

:MENU2
cls
title BatTools By Doctorwar

    	echo Menu 2
    	echo escolha uma opcao
    	echo.
    	echo (1) Desativar UAC
    	echo (2) Ativar UAC
    	echo (3) Pagina de energia do windows
    	echo (4) Ver Relatorio de Erros do Windows
    	echo (5) 
    	echo (6) 
    	echo (7) Menu 1
    	echo (8) Menu 3
    	echo (9) Sair
    	echo.
    	choice /C 123456789 /M "Selecione um numero:"
    		IF errorlevel=9 goto END
    		IF errorlevel=8 goto MENU3
    		IF errorlevel=7 goto MENU
    		IF errorlevel=6 goto OP13
    		IF errorlevel=5 goto OP12
    		IF errorlevel=4 goto OP11
    		IF errorlevel=3 goto OP10
    		IF errorlevel=2 goto OP9
    		IF errorlevel=1 goto OP8

:MENU3
cls
title BatTools By Doctorwar

    	echo Menu 3
    	echo escolha uma opcao
    	echo.
    	echo (1) 
    	echo (2) 
    	echo (3) 
    	echo (4) 
    	echo (5) 
    	echo (6) 
    	echo (7) Menu 1
    	echo (8) Menu 2
    	echo (9) Sair
    	echo.
    	choice /C 123456789 /M "Selecione um numero:"
    		IF errorlevel=9 goto END
    		IF errorlevel=8 goto MENU2
    		IF errorlevel=7 goto MENU
    		IF errorlevel=6 goto OP19
    		IF errorlevel=5 goto OP18
    		IF errorlevel=4 goto OP17
    		IF errorlevel=3 goto OP16
    		IF errorlevel=2 goto OP15
    		IF errorlevel=1 goto OP14


::***************************************************************************

:OP1
cls
title ipconfig
    	ipconfig
    	pause
    	goto MENU

::***************************************************************************

:OP2
cls
title ping google
    	ping google.com

title ping uol
	ping uol.com

title ping facebook
	ping facebook.com

    	pause
    	goto MENU

::***************************************************************************

:OP3
cls
title ping google (sem parar)

    	ping google.com /t
	pause
    	goto MENU

::***************************************************************************

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

::***************************************************************************

:OP5
cls
title Reparador do windows SFC SCANNOW (sem reiniciar)

    	sfc /scannow
    	echo.

    	title Reparador do windows DISM
    	dism /online /cleanup-image /restorehealth
    	echo.

	goto MENU

::***************************************************************************

:OP6
cls
title User Backup

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

::***************************************************************************

:OP7
cls
title Trocando Ip
    
	ipconfig/flushdns
    	ipconfig/release
    	ipconfig/renew
    	ipconfig/registerdns
    	pause
    	goto MENU

::***************************************************************************

:OP8
cls
title desativar uac
    	
	echo Deseja realmente desativar o UAC? (nao recomendado para usuarios nao avancados)
    	echo (UAC sao as mensagens do sistema que pedem permissao para abrir programas como administrador)
    	choice /C SN /M "Aperte  Aperte S Ativar o UAC/ aperte N para voltar ao menu:"
    		IF errorlevel=2 goto MENU
    		IF errorlevel=1 goto UACDESATIVAR
	:UACDESATIVAR
   	cls
   	echo O programa batTools deixara de funcionar nesta janela apos ativaçao do UAC, caso necessario abra o programa novamente
   	echo apos execucao do comando reinicie o computador para aplicar as alteracoes
   	pause
   	cls
   	echo desativando uac
   	C:\Windows\System32\cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f 
	pause
	goto MENU

::***************************************************************************

:OP9
cls
    	echo Deseja realmente ativar o UAC?
    	echo (UAC sao as mensagens do sistema que pedem permissao para abrir programas como administrador)
    	choice /C SN /M "Aperte  Aperte S Ativar o UAC/ aperte N para voltar ao menu:"
    		IF errorlevel=2 goto MENU
    		IF errorlevel=1 goto UACATIVAR
	:UACATIVAR
   	cls
   	echo O programa batTools deixara de funcionar nesta janela apos ativaçao do UAC, caso necessario abra o programa novamente
   	echo apos execucao do comando reinicie o computador para aplicar as alteracoes
   	pause
   	cls
   	echo ativando uac
   	C:\Windows\System32\cmd.exe /k %windir%\System32\reg.exe ADD  HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v  EnableLUA /t REG_DWORD /d 1 /f

::***************************************************************************

:OP10
cls
	control powercfg.cpl
    	goto MENU

::***************************************************************************

:OP11
cls
	perfmon /rel
	goto MENU
    	pause
    	goto MENU

::***************************************************************************

:OP12
    	echo opçao vazia
    	pause
    	goto MENU

::***************************************************************************

:OP13
    	echo opçao vazia
    	pause
    	goto MENU

::***************************************************************************

:OP14
    	echo opçao vazia
    	pause
    	goto MENU

::***************************************************************************

:OP15
    	echo opçao vazia
    	pause
    	goto MENU

::***************************************************************************

:OP16
    	echo opçao vazia
    	pause
    	goto MENU

::***************************************************************************

:OP17
    	echo opçao vazia
    	pause
    	goto MENU

::***************************************************************************

:OP18
    	echo opçao vazia
    	pause
    	goto MENU

::***************************************************************************

:OP19
    	echo opçao vazia
    	pause
    	goto MENU

::***************************************************************************

:REINICIAR
    	shutdown -r -t 5
    	cls
    	title REINICIANDO
    	echo reiniciando em 5 segundos
    	pause

::***************************************************************************

:END
    	cls
    	echo Deseja encerrar o programa?
    	choice /C SN /M "Aperte  Aperte S para fechar o programa / aperte N para voltar ao menu:"
    		IF errorlevel=2 goto MENU
    		IF errorlevel=1 exit
