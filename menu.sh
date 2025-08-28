#!/bin/bash

while true; do
    clear
    echo "=== Bash-Konverter Menü ==="
    echo "1) Manuelle Konvertierung starten"
    echo "2) Ordnerüberwachung starten (watch.sh)"
    echo "3) Beenden"
    echo "4) PDF-Vergleich starten"
    echo "============================="
    read -p "Auswahl: " option

    case $option in
        1)
            ./convert.sh
            read -p "Drücke Enter zum Zurückkehren..."
            ;;
        2)
            ./watch.sh
            read -p "Drücke Enter zum Zurückkehren..."
            ;;
        3)
            echo "Beende..."
            exit 0
            ;;
        4)
            ./compare.sh
            read -p "Drücke Enter zum Zurückkehren..."
            ;;
        *)
            echo "❌ Ungültige Auswahl!"
            sleep 1
            ;;
    esac
done

