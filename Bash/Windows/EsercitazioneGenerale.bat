@echo off 
:INIZIO
cls
echo 1 - Informazioni indirizzi ip
echo 2 - Ping verso gateway
echo 3 - Ping verso ispascalcomadnini
echo 4 - Tracer pacchetti verso pascalcomandini
echo 5 - Esci
choice /c 12345 /M "Scegli un'opzione: "

if errorlevel 5 goto ESCI
if errorlevel 4 goto TRACERTIP
if errorlevel 3 goto PINGSC
if errorlevel 2 goto PINGINT
if errorlevel 1 goto INFOIP

:INFOIP
cls
echo Informazioni di sistema
ipconfig /all
pause
goto INIZIO

:PINGSC
cls
ping 89.46.109.17
pause
goto INIZIO

:TRACERTIP
cls
tracert 89.46.109.17
pause
goto INIZIO

:PINGINT
cls
set gateway=8.8.8.8
ping %gateway%
pause
goto INIZIO

:ESCI
cls 
echo Uscita dal programma...
pause
exit