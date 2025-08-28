# bash-converter

Ein Bash-Skript zur automatisierten Konvertierung von Bildern und Textdateien in PDF-Dateien.

## 🔧 Funktionen

- Bilder (.png, .jpg) in PDF konvertieren mit `convert` (ImageMagick)
- Textdateien (.txt, .md) in PDF umwandeln mit `pandoc`
- Eingabe- und Ausgabeordner zur besseren Organisation
- Logfile zur Dokumentation aller Konvertierungen
- Erweiterbar z. B. um automatische Ordnerüberwachung

## 🚀 Voraussetzungen

- Linux-Umgebung mit Bash
- Installierte Tools:
  ```bash
  sudo apt install imagemagick pandoc
