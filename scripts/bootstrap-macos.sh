#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE_DIR="${OPENCLAW_WORKSPACE_DIR:-$HOME/.openclaw/workspace}"
BACKUP_DIR="$WORKSPACE_DIR/.bootstrap-backups/$(date +%Y%m%d-%H%M%S)"

log() {
  printf '\n==> %s\n' "$1"
}

has() {
  command -v "$1" >/dev/null 2>&1
}

backup_if_exists() {
  local target="$1"
  if [ -e "$target" ]; then
    mkdir -p "$BACKUP_DIR"
    cp -R "$target" "$BACKUP_DIR/"
  fi
}

copy_workspace_file() {
  local name="$1"
  local src="$ROOT_DIR/config/workspace/$name"
  local dst="$WORKSPACE_DIR/$name"

  if [ ! -f "$src" ]; then
    echo "missing template: $src" >&2
    exit 1
  fi

  backup_if_exists "$dst"
  cp "$src" "$dst"
}

log "Preparing OpenClaw workspace"
mkdir -p "$WORKSPACE_DIR"
mkdir -p "$WORKSPACE_DIR/projects/experiments"
mkdir -p "$WORKSPACE_DIR/projects/active"
mkdir -p "$WORKSPACE_DIR/projects/archived"
mkdir -p "$WORKSPACE_DIR/memory"
mkdir -p "$WORKSPACE_DIR/.learnings"
mkdir -p "$WORKSPACE_DIR/skills"
mkdir -p "$WORKSPACE_DIR/briefings"

log "Checking command line tools"
if ! has git; then
  echo "git is not installed. On macOS, install Xcode Command Line Tools first:"
  echo "  xcode-select --install"
  exit 1
fi

if ! has brew; then
  log "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

log "Installing base packages"
brew install git node python jq || true

if ! has npm; then
  echo "npm is still unavailable after brew install node. Check shell PATH." >&2
  exit 1
fi

log "Installing latest OpenClaw npm tools"
npm install -g openclaw@latest clawhub@latest

log "Copying Michael workspace files"
copy_workspace_file "AGENTS.md"
copy_workspace_file "SOUL.md"
copy_workspace_file "IDENTITY.md"
copy_workspace_file "USER.md"
copy_workspace_file "TOOLS.md"

if [ ! -f "$WORKSPACE_DIR/.env.local" ]; then
  cp "$ROOT_DIR/templates/.env.example" "$WORKSPACE_DIR/.env.local"
fi

log "Bootstrap complete"
echo "Workspace: $WORKSPACE_DIR"
echo "Backups: $BACKUP_DIR"
echo
echo "Next:"
echo "  bash scripts/verify-macos.sh"
echo "  Read docs/secrets-and-auth.md"
