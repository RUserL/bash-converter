
# 🖥️ bash-converter

Ein umfangreiches Bash-Projekt zur **Konvertierung, Überwachung, Optimierung, Vergleich & Virenscan** für Dateien im geteilten Ordner `/media/sf_Compare`.

---
=== Bash-Konverter Menü ===
1) 🔄 Manuelle Konvertierung starten
2) 📷 Automatische Bildoptimierung starten
3) ❌ Beenden
4) 📄 PDF-Vergleich starten
5) 🛡️ Virenscan im geteilten Ordner starten

##  Funktionen

### 📄 1. Manuelle Konvertierung (`convert.sh`)
- Wähle eine Eingabedatei (z. B. `.txt`, `.md`, `.jpg`, `.png`, `.pdf`)
- Wähle ein **Zielformat**:
  - PDF, TXT, PNG, JPG, MD
- Die Ausgabedatei wird gespeichert unter:

```bash
/media/sf_Compare/<Dateiname>_<Datum>/
```

---

### 📑 2. PDF-Vergleich (`compare.sh`)
- Vergleicht zwei PDF-Dateien **byteweise**
- Gibt übersichtliches Ergebnis im Terminal aus:
  - ✅ Gleich
  - ❌ Unterschiedlich

---

### 🖼️ 3. Automatische Bildoptimierung (`watch.sh`)
- Überwacht den Ordner:
  ```bash
  /media/sf_Compare/Bildoptimierung
  ```
- Erkennt neue `.jpg`, `.jpeg`, `.png` Dateien
- Optimiert sie automatisch (50 % verkleinert) mit:

```bash
convert "$file" -resize 50%
```

- Speichert optimierte Version in:
  ```bash
  Bildoptimierung/optimized/
  ```

---

### 🛡️ 4. Virenscan (`virus_scan.sh`)
- Beobachtet `/media/sf_Compare` auf neue Dateien
- Erkennt neue Dateien und führt `clamscan` aus
- Erkennt "Virus" oder gibt Entwarnung
- Sendet Ergebnis per Mail an `worldaicreation` (erfordert funktionierendes `msmtp` Setup)

---


## 📁 Projektstruktur

```bash
bash-converter/
├── convert.sh          # 🔄 Konvertiert Dateien in PDF, TXT, JPG, PNG, MD
├── compare.sh          # 📄 Vergleicht zwei PDF-Dateien
├── watch.sh            # 📷 Überwacht Ordner & optimiert neue Bilder
├── virus_scan.sh       # 🛡️ Scannt neue Dateien auf Viren & versendet Mail
├── menu.sh             # 🧭 Zentrales Terminal-Menü
├── output/             # 💾 Hier landen die generierten Dateien
├── logs/               # 🗂️ Protokollverzeichnis
└── README.md           # 📘 Diese Dokumentation

---

## ⚙️ Voraussetzungen

- Linux-Umgebung mit Bash
- Installierte Tools:

```bash
sudo apt update
sudo apt install imagemagick pandoc poppler-utils clamav msmtp inotify-tools
```

---

## 💡 Hinweis

Für den Mailversand muss `msmtp` richtig eingerichtet sein, z. B. mit einem Gmail-Account oder SMTP-Relay.
