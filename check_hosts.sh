#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Utilizare: $0 <fisier_hosts>"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Eroare: Fisierul '$FILE' nu exista."
    exit 1
fi

while read -r ip host rest; do
    [[ -z "$ip" || "$ip" =~ ^# ]] && continue
    if [[ ! "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "IP invalid: $ip ($host)"
    fi
done < "$FILE"
