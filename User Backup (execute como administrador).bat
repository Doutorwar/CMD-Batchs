@ECHO OFF
title User Backup by Doctorwar
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: meu github https://github.com/Doutorwar                                  ::
:: Programa criado por Doctorwar, feito para ajudar tecnicos de informatica ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cls

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
