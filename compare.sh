#!/bin/bash

echo "=== PDF-Vergleich starten ==="
read -p "Pfad zur ersten PDF-Datei (z. B. /media/sf_Compare/compare1.pdf): " file1
read -p "Pfad zur zweiten PDF-Datei (z. B. /media/sf_Compare/compare2.pdf): " file2

# Existenz prüfen
if [ ! -f "$file1" ] || [ ! -f "$file2" ]; then
    echo -e "\e[31m❌ Eine oder beide PDF-Dateien existieren nicht!\e[0m"
    echo " - $file1"
    echo " - $file2"
    exit 1
fi

# Inhalt extrahieren
text1=$(pdftotext "$file1" -)
text2=$(pdftotext "$file2" -)

if [ "$text1" = "$text2" ]; then
    echo -e "\e[32m✅ Die PDF-Dateien sind inhaltlich gleich.\e[0m"
else
    echo -e "\e[31m❌ Die PDF-Dateien unterscheiden sich inhaltlich!\e[0m"
fi

