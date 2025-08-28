#!/bin/bash

echo "Beobachte den Ordner 'input/' auf neue Dateien..."

inotifywait -m input/ -e create -e moved_to |
while read path action file; do
  echo "Neue Datei erkannt: $file - starte Konvertierung"
  ./convert.sh
done

