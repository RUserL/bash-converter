#!/bin/bash

# 💡 Beobachte den Ordner 'Bildoptimierung' auf neue Bilddateien
WATCH_DIR="/media/sf_Compare/Bildoptimierung"
OUTPUT_DIR="$WATCH_DIR/optimized"

echo "📷 Überwache '$WATCH_DIR' auf neue Bilddateien zur Optimierung..."

mkdir -p "$OUTPUT_DIR"

inotifywait -m "$WATCH_DIR" -e create -e moved_to --format '%w%f' | while read filepath; do
  filename=$(basename "$filepath")

  # Nur Bilder mit jpg, jpeg, png
  if [[ "$filename" =~ \.(jpg|jpeg|png)$ ]]; then
    echo "🛠️ Neues Bild erkannt: $filename - starte Optimierung..."
    convert "$filepath" -resize 50% "$OUTPUT_DIR/optimized_$filename"
    echo "✅ $filename wurde optimiert und in '$OUTPUT_DIR' gespeichert."
  else
    echo "⚠️ Datei '$filename' ist kein Bild (.jpg/.jpeg/.png) – wird ignoriert."
  fi
done
