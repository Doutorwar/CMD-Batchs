@ECHO OFF
title Reparador do windows by Doctorwar
cls

echo sfc scannow
sfc /scannow

echo dism
dism /online /cleanup-image /restorehealth

echo chkdsk
chkdsk /r
choice /C NY /M "Deseja reiniciar agora? Aperte Y para reiniciar / aperte N para fechar o programa"
IF errorlevel=2 goto REINICIAR
IF errorlevel=1 goto END

:REINICIAR
shutdown -r -t 5
cls
echo reiniciando em 5 segundos

:END
