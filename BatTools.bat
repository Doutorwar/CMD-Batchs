ECHO OFF
cls



REM Titulo do Programa
	set titleprogram=BatTools By Doctorwar V3.3
	title %titleprogram%



REM Anuncio de abertura do programa
	echo  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo  :: Meu github https://github.com/felpsfpp                                   ::
	echo  :: Programa criado por Felipe Pinheiro.                                     ::
	echo  :: Este programa tem como objetivo auxiliar os usuarios no gerenciamento    ::
	echo  :: do Windows                                                               ::
	echo  ::                                                                          ::
	echo  :: My github https://github.com/felpsfpp                                    ::
	echo  :: Program created by Felipe Pinheiro.                                      ::
	echo  :: This program aims to help users manage of Windows                        ::
	echo  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	timeout /t 3 >nul
cls



REM ***************************************************************************
REM Verificando permissao
	if "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
        >nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
    ) else (
        >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system")

REM Se o sinalizador der erro, nao tem admin.
    if '%errorlevel%' NEQ '0' (
        echo Solicitando privilegios administrativos...
        goto UACPrompt
    ) else ( 
		goto gotAdmin )

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

REM creditos a: https://sites.google.com/site/eneerge/scripts/batchgotadmin
REM thanks to: https://sites.google.com/site/eneerge/scripts/batchgotadmin
REM ***************************************************************************



:MENU
cls
title %titleprogram% Menu 1

    echo Menu
    echo escolha uma opcao
    echo.
    echo (1) IpConfig
    echo (2) Ping Google, Uol e Facebook
    echo (3) Ping Google (sem parar)
    echo (4) Reparar Windows
    echo (5) Reparar Windows (sem check disk, nao reinicia)
    echo (6) Backup de pasta User
    echo (7) Trocar Ip
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
title %titleprogram% Menu 2

    echo Menu 2
    echo escolha uma opcao
    echo.
    echo (1) Desativar UAC
    echo (2) Ativar UAC
    echo (3) Pagina de energia do windows
    echo (4) Ver Relatorio de Erros do Windows
    echo (5) Script completo BABOO V32 (Limpeza de arquivos temporarios do sistema)
    echo (6) Ativar trim
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
title %titleprogram% Menu 3

	echo Menu 3
   	echo escolha uma opcao
   	echo.
   	echo (1) Checar trim
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
echo ping Google
title ping Google
    	ping google.com
		
echo.
echo.
echo.

echo ping Uol
title ping Uol
	ping uol.com

echo.
echo.
echo.

echo ping Facebook
title ping Facebook
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

    	title Reparador do windows CHKDSK
    	chkdsk /r
    	echo.
		
		choice /C NS /M "Deseja reiniciar o computador ao terminar o script? Aperte S para reiniciar / aperte N para reiniciar depois"
    	IF errorlevel=2 goto REINICIAROP4
    	IF errorlevel=1 goto NAOREINICIAROP4
		
		:REINICIAROP4
		
    	sfc /scannow
    	echo.

    	title Reparador do windows DISM
    	dism /online /cleanup-image /restorehealth
    	echo.
		
		goto REINICIAR
		
		:NAOREINICIAROP4
		
		sfc /scannow
    	echo.

    	title Reparador do windows DISM
    	dism /online /cleanup-image /restorehealth
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
goto MENU

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

::***************************************************************************

:OP12
cls
::***************************************************************************
   	REM | SCRIPT PARA ELIMINACAO DE ARQUIVOS TEMPORARIOS
	REM | da Lixeira, Windows, Logs, Navegadores e Adobe Media Cache
	REM | BABOO 2024 - www.baboo.com.br/script
	REM |
	REM | Versão 3.2 - 23/05/2024
	REM | - remocao de arquivos do Spotify
	REM | - remocao de arquivos de log do OneDrive
	REM | - remocao de arquivos temporários do VMWare
	REM | - remocao de arquivos temporários do TeamViewer
	REM | - remocao dos arquivos temporários de até 12 perfis dos navegadores Edge, Chrome e Vivaldi
	REM |
	REM | *****   IMPORTANTE   *****
	REM | Embora o codigo desse script permita apagar arquivos temporarios de TODOS
	REM | os usuarios cadastrados no Windows, isso acontece SOMENTE se o usuario atual
	REM | tiver acesso irrestrito às pastas dos demais usuarios dentro de C:\Users. 
	REM | 
	REM | Se o usuario atual não consegue acessar as pastas dos demais usuarios dentro
	REM | de C:\Users, este script apaga SOMENTE os arquivos temporarios do usuario atual.
	REM | 
	REM | Isso acontece apenas *por questao de seguranca*, pois a remocao dos arquivos
	REM | temporarios dos demais usuarios exige a mudança nas permissoes de 
	REM | centenas ou milhares de pastas e arquivos dentro de C:\Usuarios. 
	REM | Alem dessa tarefa ser lenta, isso permitiria que o usuario atual tambem pudesse
	REM | acessar aqueles arquivos, colocando em risco a seguranca e privacidade dos dados
	REM | dos demais usuarios.
	REM |
	REM | *****    POWERSHELL    *****
	REM | Este script executa dois comandos simples no PowerShell. Embora eles funcionem
	REM | normalmente no Windows 10 e Windows 11, se voce utiliza Windows 7 ou 8
	REM | atualize o PowerShell em https://bit.ly/instalar-powershell
	REM | 



	REM ******************** LIXEIRA ********************
		del c:\$recycle.bin\* /s /q
		PowerShell.exe -NoProfile -Command Clear-RecycleBin -Confirm:$false >$null
		del $null



	REM ******************** PASTA TEMP DOS USUÁRIOS ********************

	REM Apaga todos arquivos da pasta Temp de todos os usuários
		for /d %%F in (C:\Users\*) do (Powershell.exe Remove-Item -Path "%%F\AppData\Local\Temp\*" -Recurse -Force)

	REM cria arquivo vazio.txt dentro da pasta Temp de todos usuários
		for /d %%F in (C:\Users\*) do type nul >"%%F\Appdata\Local\Temp\vazio.txt"

	REM apaga todas as pastas vazias dentro da pasta Temp de todos usuários (mas não apaga a própria pasta Temp)
		for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Temp\ %%F\AppData\Local\Temp\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np

	REM Apaga arquivo vazio.txt dentro da pasta Temp de todos usuários
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Temp\vazio.txt



	REM ******************** WINDOWS TEMP ********************

	REM Apaga todos arquivos da pasta \Windows\Temp, mantendo das pastas
		del c:\Windows\Temp\* /s /q

	REM cria arquivo vazio.txt dentro da pasta \Windows\Temp
		type nul > c:\Windows\Temp\vazio.txt

	REM apaga todas as pastas vazias dentro da pasta \Windows\Temp (mas não apaga a própria pasta)
		robocopy c:\Windows\Temp c:\Windows\Temp /s /move /NFL /NDL /NJH /NJS /nc /ns /np

	REM Apaga arquivo vazio.txt dentro da pasta \Windows\Temp
		del c:\Windows\Temp\vazio.txt



	REM ******************** ARQUIVOS DE LOG DO WINDOWS *********************
		del C:\Windows\Logs\cbs\*.log	
		del C:\Windows\setupact.log	
		attrib -s c:\windows\logs\measuredboot\*.*
		del c:\windows\logs\measuredboot\*.log
		attrib -h -s C:\Windows\ServiceProfiles\NetworkService\
		attrib -h -s C:\Windows\ServiceProfiles\LocalService\
		del C:\Windows\ServiceProfiles\LocalService\AppData\Local\Temp\MpCmdRun.log
		del C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\MpCmdRun.log
		attrib +h +s C:\Windows\ServiceProfiles\NetworkService\
		attrib +h +s C:\Windows\ServiceProfiles\LocalService\
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\*.log /s /q
		del C:\Windows\Logs\MeasuredBoot\*.log 
		del C:\Windows\Logs\MoSetup\*.log
		del C:\Windows\Panther\*.log /s /q
		del C:\Windows\Performance\WinSAT\winsat.log /s /q
		del C:\Windows\inf\*.log /s /q
		del C:\Windows\logs\*.log /s /q
		del C:\Windows\SoftwareDistribution\*.log /s /q
		del C:\Windows\Microsoft.NET\*.log /s /q



	REM ******************** ARQUIVOS DE LOG DO ONEDRIVE ********************
		taskkill /F /IM "OneDrive.exe"
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\OneDrive\setup\logs\*.log /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\OneDrive\*.odl /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\OneDrive\*.aodl /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\OneDrive\*.otc /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\OneDrive\*.qmlc /s /q



	REM ******************** ARQUIVOS DE DUMP DE PROGRAMAS (NÃO DO WINDOWS) ********************
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\CrashDumps\*.dmp /s /q



	REM ******************** ARQUIVOS DE LOG DO WINDOWS E IE ********************
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\Explorer\*.db /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\WebCache\*.log /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\SettingSync\*.log /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\"Terminal Server Client"\Cache\*.bin /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\IE\* /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.dat /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.js /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.htm /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.txt /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.jpg /s /q
		for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Microsoft\Windows\INetCache\IE\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np



	REM ******************** EDGE ********************
		taskkill /F /IM "msedge.exe"
		for /d %%F in (C:\Users\*) do attrib -h -s %%F\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\*.*
		for /d %%F in (C:\Users\*) do attrib -h -s %%F\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*.*
		for /d %%F in (C:\Users\*) do del %%F\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\*.* /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*.* /s /q
		for /d %%F in (C:\Users\*) do attrib +h +s %%F\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content
		for /d %%F in (C:\Users\*) do attrib +h +s %%F\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\Cache_Data\data*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\Cache\Cache_Data\data*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\Cache\Cache_Data\data*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\Cache_Data\f*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\Cache\Cache_Data\f*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\Cache\Cache_Data\f*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\Cache_Data\index. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\Cache\Cache_Data\index. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\Cache\Cache_Data\index. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\d*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\GPUCache\d*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\GPUCache\d*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\i*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\GPUCache\i*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\GPUCache\i*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\IndexedDB\https_ntp.msn.com_0.indexeddb.leveldb\*.* /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\IndexedDB\https_ntp.msn.com_0.indexeddb.leveldb\*.* /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\IndexedDB\https_ntp.msn.com_0.indexeddb.leveldb\*.* /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\*.pma /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Code Cache"\js\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\"Code Cache"\js\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\"Code Cache"\js\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Code Cache"\wasm\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\"Code Cache"\wasm\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\"Code Cache"\wasm\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Platform Notifications"\*.* /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\"Platform Notifications"\*.* /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\"Platform Notifications"\*.* /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgePushStorageWithWinRt\*.log /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\EdgePushStorageWithWinRt\*.log /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\EdgePushStorageWithWinRt\*.log /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"File System"\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\"File System"\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\"File System"\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\"Service Worker"\CacheStorage\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\"Service Worker"\CacheStorage\*. /s /q)
		for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\ %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
		for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\"Service Worker"\CacheStorage\ %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\"Service Worker"\CacheStorage\ %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\Database\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\"Service Worker"\Database\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\"Service Worker"\Database\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\ScriptCache\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\"Service Worker"\ScriptCache\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\"Service Worker"\ScriptCache\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgeCoupons\coupons_data.db\*.ldb /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\EdgeCoupons\coupons_data.db\*.ldb /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\EdgeCoupons\coupons_data.db\*.ldb /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgeCoupons\coupons_data.db\index. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\EdgeCoupons\coupons_data.db\index. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\EdgeCoupons\coupons_data.db\index. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgeCoupons\coupons_data.db\*.log /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Guest Profile"\EdgeCoupons\coupons_data.db\*.log /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\"Profile %%i"\EdgeCoupons\coupons_data.db\*.log /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\BrowserMetrics\*.pma /s /q



	REM ******************** FIREFOX ********************
		taskkill /F /IM "firefox.exe"
		for /d %%F in (C:\Users\*) do del %%F\AppData\local\Mozilla\Firefox\Profiles\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\local\Mozilla\Firefox\Profiles\script*.bin /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\local\Mozilla\Firefox\Profiles\startup*.* /s /q



	REM ******************** CHROME ********************
		taskkill /F /IM "chrome.exe"
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Cache\Cache_Data\data*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\Cache\Cache_Data\data*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\Cache\Cache_Data\data*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Cache\Cache_Data\f*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\Cache\Cache_Data\f*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\Cache\Cache_Data\f*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Cache\Cache_Data\index. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\Cache\Cache_Data\index. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\Cache\Cache_Data\index. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\d*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\GPUCache\d*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\GPUCache\d*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\i*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\GPUCache\i*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\GPUCache\i*. /s /q)
		del C:\Program Files\Google\Chrome\Application\SetupMetrics\*.pma /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Code Cache"\js\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\"Code Cache"\js\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\"Code Cache"\js\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Code Cache"\wasm\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\"Code Cache"\wasm\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\"Code Cache"\wasm\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Storage\data_*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\Storage\data_*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\Storage\data_*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\JumpListIconsRecentClosed\*.tmp /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\JumpListIconsRecentClosed\*.tmp /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\JumpListIconsRecentClosed\*.tmp /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Storage\index*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\Storage\index*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\Storage\index*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\History-journal*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\History-journal*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\History-journal*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Code Cache"\webui_js\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\"Code Cache"\webui_js\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\"Code Cache"\webui_js\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\"Service Worker"\CacheStorage\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\"Service Worker"\CacheStorage\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\Database\*.log /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\"Service Worker"\Database\*.log /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\"Service Worker"\Database\*.log /s /q)
		for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\ %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
		for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\"Service Worker"\CacheStorage\ %%F\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\"Service Worker"\CacheStorage\ %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\Database\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\"Service Worker"\Database\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\"Service Worker"\Database\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\ScriptCache\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Guest Profile"\"Service Worker"\ScriptCache\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\"Profile %%i"\"Service Worker"\ScriptCache\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\BrowserMetrics*.pma /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\crash*.pma /s /q



	REM ******************** BRAVE ********************
		taskkill /F /IM "brave.exe"
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\Cache_Data\data*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\Cache\Cache_Data\data*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\Cache_Data\f*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\Cache\Cache_Data\f*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\Cache_Data\index. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\Cache\Cache_Data\index. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\GPUCache\d*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\GPUCache\d*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\GPUCache\i*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\GPUCache\i*. /s /q
		del C:\Program Files\BraveSoftware\Brave-Browser\Application\SetupMetrics\*.pma /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Code Cache"\js\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\"Code Cache"\js\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Code Cache"\wasm\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\"Code Cache"\wasm\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Storage\data_*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\Storage\data_*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\JumpListIconsRecentClosed\*.tmp /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\JumpListIconsRecentClosed\*.tmp /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Storage\index*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\Storage\index*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\History-journal*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\History-journal*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Code Cache"\webui_js\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\"Code Cache"\webui_js\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\"Service Worker"\CacheStorage\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\Database\*.log /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\"Service Worker"\Database\*.log /s /q
		for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\ %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
		for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\"Service Worker"\CacheStorage\ %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\Database\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\"Service Worker"\Database\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\ScriptCache\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Guest Profile"\"Service Worker"\ScriptCache\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\BrowserMetrics*.pma /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\crash*.pma /s /q



	REM ******************** VIVALDI ********************
		taskkill /F /IM "vivaldi.exe"
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\Cache\Cache_Data\data*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\Cache\Cache_Data\data*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\Cache\Cache_Data\data*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\Cache\Cache_Data\f*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\Cache\Cache_Data\f*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\Cache\Cache_Data\f*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\Cache\Cache_Data\index. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\Cache\Cache_Data\index. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\Cache\Cache_Data\index. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\GPUCache\d*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\GPUCache\d*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\GPUCache\d*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\GPUCache\i*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\GPUCache\i*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\GPUCache\i*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Code Cache"\js\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\"Code Cache"\js\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\"Code Cache"\js\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Code Cache"\wasm\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\"Code Cache"\wasm\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\"Code Cache"\wasm\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\Storage\data_*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\Storage\data_*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\Storage\data_*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\JumpListIconsRecentClosed\*.tmp /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\JumpListIconsRecentClosed\*.tmp /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\JumpListIconsRecentClosed\*.tmp /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\Storage\index*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\Storage\index*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\Storage\index*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\History-journal*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\History-journal*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\History-journal*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Code Cache"\webui_js\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\"Code Cache"\webui_js\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\"Code Cache"\webui_js\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\CacheStorage\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\"Service Worker"\CacheStorage\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\"Service Worker"\CacheStorage\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\Database\*.log /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\"Service Worker"\Database\*.log /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\"Service Worker"\Database\*.log /s /q)
		for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\CacheStorage\ %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
		for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\"Service Worker"\CacheStorage\ %%F\AppData\Local\Vivaldi\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\"Service Worker"\CacheStorage\ %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\Database\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\"Service Worker"\Database\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\"Service Worker"\Database\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\Default\"Service Worker"\ScriptCache\*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Guest Profile"\"Service Worker"\ScriptCache\*. /s /q
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\"Profile %%i"\"Service Worker"\ScriptCache\*. /s /q)
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\BrowserMetrics*.pma /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Vivaldi\"User Data"\crash*.pma /s /q



	REM ******************** SPOTIFY ********************
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Spotify\Data\*.file /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Spotify\Browser\Cache\"Cache_Data"\f*. /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Spotify\Browser\GPUCache\*. /s /q



	REM ******************** ADOBE MEDIA CACHE FILES ********************
		for /d %%F in (C:\Users\*) do del %%F\AppData\Roaming\Adobe\Common\"Media Cache files"\*.* /s /q
		for /d %%F in (C:\Users\*) do del %%F\AppData\Roaming\Adobe\*.log /s /q



	REM ******************** VMWARE ********************
		del C:\ProgramData\VMware\logs\*.log /s /q



	REM ******************** TeamViewer ********************
		for /l %%i in (1,1,12) do (for /d %%F in (C:\Users\*) do del %%F\AppData\Local\TeamViewer\EdgeBrowserControl\Persistent\data_*.  /s /q)
		for /d %%u in (C:\Users\*) do (if exist "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" (forfiles /P "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" /S /M *_0 /C "cmd /c del @path"))
		for /d %%u in (C:\Users\*) do (if exist "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" (forfiles /P "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" /S /M *_1 /C "cmd /c del @path"))
		for /d %%u in (C:\Users\*) do (if exist "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" (forfiles /P "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" /S /M *_2 /C "cmd /c del @path"))
		for /d %%u in (C:\Users\*) do (if exist "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" (forfiles /P "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" /S /M *_3 /C "cmd /c del @path"))
		for /d %%u in (C:\Users\*) do (if exist "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" (forfiles /P "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" /S /M *_4 /C "cmd /c del @path"))
		for /d %%u in (C:\Users\*) do (if exist "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" (forfiles /P "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" /S /M *_5 /C "cmd /c del @path"))
		for /d %%u in (C:\Users\*) do (if exist "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" (forfiles /P "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" /M "f_*." /C "cmd /c del @path"))
		for /d %%u in (C:\Users\*) do (if exist "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" (forfiles /P "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" /M "data.*" /C "cmd /c del @path"))
		for /d %%u in (C:\Users\*) do (if exist "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" (forfiles /P "%%u\AppData\Local\TeamViewer\EdgeBrowserControl" /M "index.*" /C "cmd /c del @path"))
cls
echo Arquivos temporarios Limpos
pause
goto MENU

::***************************************************************************

:OP13
cls
	echo essa acao tem efeito imediatamente, nao e necessario reiniciar
	echo.
	echo.
	echo.
    fsutil behavior set DisableDeleteNotify 0
    pause
goto MENU

::***************************************************************************

:OP14
cls
	echo Em SSD o TRIM deve estar ativo ou seja = 0
	echo Se o resultado for = 1 entao o TRIM esta desativado
	echo.
	echo.
	echo.
	fsutil behavior query DisableDeleteNotify
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
