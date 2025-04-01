@echo off
goto INIZIO
:INIZIO
cls
echo 1 - Mostra elenco di file nella cartella
echo 2 - Crea cartella
echo 3 - Mosta info di sistema
echo 4 - Esci dal programma
choice /c 1234 /M "Scegli un'opzione: "
if errorlevel 4 goto USCITA
if errorlevel 3 goto INFO
if errorlevel 2 goto CREACART
if errorlevel 1 goto MOSTRAFILE
:INFO
cls
echo Informazioni di sistema
systeminfo
pause
goto INIZIO
:CREACART
cls
set /p nome="Inserica nome cartella "
echo Creazione di una cartella
mkdir %nome%
echo Cartella Creata
pause 
goto INIZIO
:MOSTRAFILE
cls
echo Mostrando i file
dir
pause
goto INIZIO
:USCITA 
cls 
echo Uscita dal programma...
pause
exit
