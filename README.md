
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

###  1. Manuelle Konvertierung (`convert.sh`)
- Wähle eine Eingabedatei (z. B. `.txt`, `.md`, `.jpg`, `.png`, `.pdf`)
- Wähle ein **Zielformat**:
  - PDF, TXT, PNG, JPG, MD
- Die Ausgabedatei wird gespeichert unter:

```bash
/media/sf_Compare/<Dateiname>_<Datum>/
```

---

###  2. PDF-Vergleich (`compare.sh`)
- Vergleicht zwei PDF-Dateien **byteweise**
- Gibt übersichtliches Ergebnis im Terminal aus:
  - ✅ Gleich
  - ❌ Unterschiedlich

---

###  3. Automatische Bildoptimierung (`watch.sh`)
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

###  4. Virenscan (`virus_scan.sh`)
- Beobachtet `/media/sf_Compare` auf neue Dateien
- Erkennt neue Dateien und führt `clamscan` aus
- Erkennt "Virus" oder gibt Entwarnung
- Sendet Ergebnis per Mail an `worldaicreation` (erfordert funktionierendes `msmtp` Setup)

---


##  Projektstruktur

```bash
bash-converter/
├── convert.sh            # Hauptskript zur Konvertierung
├── input/                # Eingabedateien (.txt, .jpg etc.)
│   └── .gitkeep
├── output/               # Generierte Ausgabedateien
├── log.txt               # Protokolliert die Konvertierung
├── compare.sh            # PDF-Vergleichsskript
├── watch.sh              # Automatische Bildoptimierung
├── virus_scan.sh         # Automatischer Virenscan
├── menu.sh               # Terminalmenü zur Bedienung
└── README.md             # Diese Dokumentation
```

---

##  Voraussetzungen

- Linux-Umgebung mit Bash
- Installierte Tools:

```bash
sudo apt install imagemagick pandoc inotify-tools clamav msmtp
```

---

## 💡 Hinweis

Für den Mailversand muss `msmtp` richtig eingerichtet sein, z. B. mit einem Gmail-Account oder SMTP-Relay.

##  Erweiterung: Headless & Automatisierte Nutzung

Das Projekt unterstützt einen **Headless-Modus** zur automatisierten Ausführung **ohne Benutzerinteraktion**.


####  Eingabeverzeichnis mit `-d` oder Umgebungsvariable `CHECK_DIR`

Du kannst das Eingabeverzeichnis auf zwei Arten angeben:

- Per Parameter:
  ```bash
  ./convert.sh -d /media/sf_Compare/input
  ```

- Oder mit Umgebungsvariable:
  ```bash
  export CHECK_DIR="/media/sf_Compare/input"
  ./convert.sh -a
  ```

#### ⚙ Headless Menü starten

Das Menü kann komplett automatisiert im Hintergrund gestartet werden:

```bash
./menu.sh --headless [Optionen]
```

Verfügbare Optionen:

| Option                  | Beschreibung                                               |
|------------------------|------------------------------------------------------------|
| `--headless`           | Aktiviert den Headless-Modus (kein Benutzer-Input)         |
| `--compare file1 file2`| Startet PDF-Vergleich mit zwei Dateien                     |
| `--convert`            | Startet Konvertierung aller Dateien im Eingabeordner      |
| `--watch`              | Startet automatische Bildüberwachung                       |
| `--virus-scan`         | Startet Hintergrund-Virenscan für neue Dateien             |

Beispiel:
```bash
./menu.sh --headless --convert
```

Oder:
```bash
./menu.sh --headless --compare A.pdf B.pdf
```

---

###  Headless-Abläufe kombinieren

Du kannst auch komplette Konvertierung + Vergleich automatisiert aufrufen:

```bash
export CHECK_DIR="/media/sf_Compare/input"
./menu.sh --headless --convert --compare file1.pdf file2.pdf
```

---

###  Beispielablauf mit Crontab

Das Skript lässt sich regelmässig ausführen:

```bash
crontab -e
```

Dann z. B.:

```cron
0 * * * * /pfad/zum/projekt/menu.sh --headless --watch >> /pfad/zum/logs/watch_cron.log
```

---

##  Vorteile der Headless-Erweiterung

✅ Keine Benutzerinteraktion notwendig  
✅ Ideal für automatisierte Workflows und Cronjobs  
✅ Kombinierbare Module für maximale Flexibilität  
✅ Unterstützt Shared Folder wie `/media/sf_Compare`
