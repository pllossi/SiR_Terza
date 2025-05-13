#!/bin/bash

n=0
while [ "$n" -ne 4 ]; do
    echo "1 - Visualizzare impostazioni di rete"
    echo "2 - Test di connessione verso indirizzo della scuola"
    echo "3 - Test di instradamento pacchetti verso indirizzo della scuola"
    echo "4 - Uscire dal programma"
    
    read -p "Inserisca la scelta tra 1 e 4: " n

    if [ "$n" -eq 1 ]; then
        ip a
    elif [ "$n" -eq 2 ]; then
        ping -c 4 89.46.109.17
    elif [ "$n" -eq 3 ]; then
        traceroute 89.46.109.17
    fi
done

echo "Arrivederci!"
