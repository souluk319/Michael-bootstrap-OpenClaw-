#!/usr/bin/env bash
set -euo pipefail

TOOLS=("openclaw" "clawhub")

log() {
  printf '\n==> %s\n' "$1"
}

has() {
  command -v "$1" >/dev/null 2>&1
}

installed_version() {
  local package="$1"
  local version
  version="$(
    { npm list -g "$package" --depth=0 2>/dev/null || true; } \
      | sed -n "s/.*${package}@//p" \
      | head -n 1
  )"

  if [ -n "$version" ]; then
    printf '%s' "$version"
  else
    printf 'not installed'
  fi
}

latest_version() {
  local package="$1"
  npm view "$package" version 2>/dev/null || printf 'unknown'
}

print_versions() {
  local label="$1"
  log "$label"

  local tool
  for tool in "${TOOLS[@]}"; do
    printf '%-8s current: %s  latest: %s\n' \
      "$tool" \
      "$(installed_version "$tool")" \
      "$(latest_version "$tool")"
  done
}

if ! has npm; then
  echo "npm is required. Install Node.js first, then rerun this script." >&2
  exit 1
fi

print_versions "Before update"

log "Installing latest OpenClaw npm tools"
npm install -g openclaw@latest clawhub@latest

print_versions "After update"

log "Update complete"
