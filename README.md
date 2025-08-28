# bash-converter

Ein Bash-Skript zur automatisierten Konvertierung von Bildern und Textdateien in PDF-Dateien.

---

## 🔧 Funktionen

- 🖼️ Bilder (.png, .jpg) in PDF konvertieren mit [`convert`](https://imagemagick.org) (ImageMagick)
- 📄 Textdateien (.txt, .md) in PDF umwandeln mit [`pandoc`](https://pandoc.org)
- 📁 Klare Trennung von Eingabe- und Ausgabedateien über Ordnerstruktur
- 📝 Automatisches Logfile mit Zeitstempel
- 🔄 Erweiterbar mit:
  - Ordnerüberwachung per `inotifywait`
  - Terminalmenü zur Bedienung

---

## 🚀 Voraussetzungen

- Linux-Umgebung mit Bash
- Installierte Tools:
  ```bash
  sudo apt install imagemagick pandoc

## 📂 Projektstruktur

```bash
bash-converter/
├── convert.sh          # Hauptskript zur Konvertierung
├── input/              # Eingabedateien (z. B. .txt oder .jpg)
│   └── .gitkeep        # Platzhalterdatei für Git
├── output/             # Hier landen die generierten PDFs
├── log.txt             # Protokolliert alle Konvertierungsvorgänge
└── README.md           # Projektdokumentation
