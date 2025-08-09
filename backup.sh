#!/usr/bin/env bash
set -euo pipefail
SRC_DIR="${1:-$HOME}"
DEST_DIR="${2:-$PWD/backups}"
mkdir -p "$DEST_DIR"
STAMP="$(date +%F_%H%M%S)"
TAR="$DEST_DIR/backup_${STAMP}.tar.gz"
tar --exclude="$DEST_DIR" -czf "$TAR" "$SRC_DIR"
echo "Created: $TAR"
