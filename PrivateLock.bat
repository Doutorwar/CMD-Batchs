@ECHO OFF
title Private lock by Doctorwar
cls

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: meu github https://github.com/felpsfpp                                   ::
:: Programa criado por Doctorwar, feito para ajudar tecnicos de informatica ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Private goto FOLDER

:LOCK
ren Private "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
goto END

:UNLOCK
echo Pass
set/p "pass=>"
if NOT %pass%== 123123 goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Private
goto END

:FAIL
echo Senha Invalida
goto UNLOCK

:FOLDER
md Private
:END
