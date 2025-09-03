#!/bin/bash
INPUT_FILE="$1"
TARGET_FORMAT="$2"
BASENAME=$(basename "$INPUT_FILE")
NAME="${BASENAME%.*}"
DATE=$(date +%F)
OUT_DIR="/media/sf_Compare/${NAME}_${DATE}"

mkdir -p "$OUT_DIR"

case "$TARGET_FORMAT" in
    txt)
        pdftotext "$INPUT_FILE" "$OUT_DIR/${NAME}.txt"
        ;;
    png)
        pdftoppm "$INPUT_FILE" "$OUT_DIR/${NAME}" -png
        ;;
    jpg)
        pdftoppm "$INPUT_FILE" "$OUT_DIR/${NAME}" -jpeg
        ;;
    md)
        pdftotext "$INPUT_FILE" - | pandoc -f plain -t markdown -o "$OUT_DIR/${NAME}.md"
        ;;
    pdf)
        cp "$INPUT_FILE" "$OUT_DIR/${NAME}.pdf"
        ;;
    *)
        echo "❌ Ungültiges Zielformat"
        exit 1
        ;;
esac
