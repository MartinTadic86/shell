#!/bin/bash

# Kontrola argumentů
if [ $# -eq 0 ]
  then
    echo "Není zadaná adresa URL."
    exit 1
fi

# Uložení URL adresy do proměnné
URL=$1

# Zobrazení URL adresy v terminálu
echo "Zadaná URL adresa: $URL"

# Stažení HTML dokumentu ze zadané URL adresy
curl -s $URL > dokument.html

# Výběr odstavců pomocí regulárních výrazů
odstavce=$(grep -oP '<p.*?>.*?</p>' dokument.html)

# Zobrazení vybraných odstavců v terminálu
echo "Vybrané odstavce:"
echo $odstavce

# Uložení vybraných odstavců do souboru
echo $odstavce > odstavce.txt

# Komprimace souboru pomocí gzip
gzip odstavce.txt

# Zobrazení zprávy o úspěšném dokončení skriptu
echo "Skript byl úspěšně dokončen."

