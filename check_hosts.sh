#!/usr/bin/env bash
set -euo pipefail
FILE="${1:-hosts.txt}"
while IFS= read -r host; do
  [[ -z "$host" || "$host" =~ ^# ]] && continue
  if ping -c1 -W1 "$host" >/dev/null 2>&1; then
    echo "[OK] $host"
  else
    echo "[DOWN] $host"
  fi
done < "$FILE"
