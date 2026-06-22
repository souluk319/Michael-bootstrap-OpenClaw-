#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE_DIR="${OPENCLAW_WORKSPACE_DIR:-$HOME/.openclaw/workspace}"
BACKUP_DIR="$WORKSPACE_DIR/.bootstrap-backups/$(date +%Y%m%d-%H%M%S)"

mkdir -p "$WORKSPACE_DIR"

copy_one() {
  local src_name="$1"
  local dst_name="${2:-$src_name}"
  local src="$ROOT_DIR/config/workspace/$src_name"
  local dst="$WORKSPACE_DIR/$dst_name"

  if [ ! -f "$src" ]; then
    echo "missing template: $src" >&2
    exit 1
  fi

  if [ -f "$dst" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "$dst" "$BACKUP_DIR/$dst_name"
  fi

  cp "$src" "$dst"
  echo "synced $dst_name"
}

copy_one "AGENTS.md"
copy_one "SOUL.md"
copy_one "IDENTITY.md"
copy_one "USER.example.md" "USER.md"
copy_one "TOOLS.md"

echo "Workspace sync complete: $WORKSPACE_DIR"
echo "Backups: $BACKUP_DIR"
