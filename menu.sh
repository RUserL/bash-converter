#!/bin/bash

while true; do
  clear
  echo "=== Bash-Konverter Menü ==="
  echo "1) Manuelle Konvertierung starten"
  echo "2) Automatische Bildoptimierung starten (watch.sh)"
  echo "3) Beenden"
  echo "4) PDF-Vergleich starten"
  echo "5) 🛡️Virenscan im geteilten Ordner starten"
  echo "============================="
  read -p "Auswahl: " option

  case $option in
    1)
      read -p "Pfad zur Eingabedatei: " input_path
      echo "Wähle das Zielformat:"
      echo "1) PDF"
      echo "2) TXT"
      echo "3) PNG"
      echo "4) JPG"
      echo "5) MD"
      read -p "Auswahl: " format_choice

      case $format_choice in
        1) format="pdf" ;;
        2) format="txt" ;;
        3) format="png" ;;
        4) format="jpg" ;;
        5) format="md" ;;
        *) echo "❌ Ungültiges Zielformat"; sleep 2; continue ;;
      esac

      ./convert.sh "$input_path" "$format"
      read -p "Drücke Enter zum Zurückkehren..." ;;
    2)
      ./watch.sh
      read -p "Drücke Enter zum Zurückkehren..." ;;
    3)
      echo "Beende..."
      exit 0 ;;
    4)
      ./compare.sh
      read -p "Drücke Enter zum Zurückkehren..." ;;
    5)
      ./virus_scan.sh
      read -p "Drücke Enter zum Zurückkehren..." ;;
    *)
      echo "❌ Ungültige Auswahl!"
      sleep 1 ;;
  esac
done

