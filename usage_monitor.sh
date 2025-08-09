#!/usr/bin/env bash
set -euo pipefail
LANG=C
echo "=== $(date) ==="
free -m | awk '/Mem:/ {printf("RAM: %d/%d MiB (%.1f%%)\n",$3,$2,$3/$2*100)}'
top -b -n1 | awk -F'[, ]+' '/Cpu\(s\)/{printf("CPU: user %s, sys %s, idle %s\n",$3,$5,$9)}'
echo "Top CPU:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
