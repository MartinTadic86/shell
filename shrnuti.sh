#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Není zadaná adresa URL."
  exit 1
fi

URL=$1

echo "Zadaná URL adresa: $URL"

wget -q -O dokument.html $URL

if [ $? -ne 0 ]; then
  echo "Stažení stránky selhalo."
  exit 1
fi

odstavce=$(grep -oP '<p.*?>.*?</p>' dokument.html)

echo "Vybrané odstavce:"
echo $odstavce

echo $odstavce > odstavce.txt

gzip odstavce.txt

echo "Skript byl úspěšně dokončen."

