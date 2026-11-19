#!/bin/bash

FILE="$HOME/etc/hosts"

while read -r ip host rest; do
    [[ -z "$ip" || "$ip" =~ ^# ]] && continue
    if [[ ! "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "IP invalid: $ip ($host)"
    fi
done < "$FILE"
