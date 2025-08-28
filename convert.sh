#!/bin/bash

INPUT_DIR="input"
OUTPUT_DIR="output"
LOG_FILE="log.txt"

mkdir -p "$INPUT_DIR" "$OUTPUT_DIR"

echo "=== Konvertierung gestartet: $(date) ===" >> "$LOG_FILE"

# Bilder konvertieren (.png, .jpg, .jpeg)
for img in "$INPUT_DIR"/*.{png,jpg,jpeg}; do
    [ -f "$img" ] || continue
    filename=$(basename "$img")
    name="${filename%.*}"
    output="$OUTPUT_DIR/$name.pdf"
    convert "$img" "$output"
    echo "[Bild] $img → $output" >> "$LOG_FILE"
done

# Textdateien konvertieren (.txt, .md)
for txt in "$INPUT_DIR"/*.{txt,md}; do
    [ -f "$txt" ] || continue
    filename=$(basename "$txt")
    name="${filename%.*}"
    output="$OUTPUT_DIR/$name.pdf"
    pandoc "$txt" -o "$output"
    echo "[Text] $txt → $output" >> "$LOG_FILE"
done

echo "=== Konvertierung abgeschlossen: $(date) ===" >> "$LOG_FILE"
