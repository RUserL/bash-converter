#!/bin/bash

WATCH_DIR="/media/sf_Compare"
echo "🔍 Überwache '$WATCH_DIR' auf neue Dateien für Virenscan..."

inotifywait -m "$WATCH_DIR" -e create -e moved_to |
while read path action file; do
    echo "🕵️ Neue Datei erkannt: $path$file - starte Virenscan..."

    result=$(clamscan "$path$file")
    echo "$result"

    if echo "$result" | grep -q "Infected files: 0"; then
        echo "✅ Kein Virus in $path$file gefunden."
        echo "Betreff: ✅ Saubere Datei erkannt: $file

Scan-Ergebnis: 
$result" | msmtp worldaicreation@gmail.com
    else
        echo "⚠️ Achtung: Virus oder verdächtige Datei in $file!"
        echo "Betreff: ⚠️ Virus in Datei $file erkannt!

Scan-Ergebnis: 
$result" | msmtp worldaicreation@gmail.com
    fi
done
