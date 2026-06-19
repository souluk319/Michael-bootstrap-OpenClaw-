#!/usr/bin/env bash
set -euo pipefail

WORKSPACE_DIR="${OPENCLAW_WORKSPACE_DIR:-$HOME/.openclaw/workspace}"
failures=0

check_cmd() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    printf "ok   command: %s -> %s\n" "$cmd" "$(command -v "$cmd")"
  else
    printf "miss command: %s\n" "$cmd"
    failures=$((failures + 1))
  fi
}

check_file() {
  local path="$1"
  if [ -f "$path" ]; then
    printf "ok   file: %s\n" "$path"
  else
    printf "miss file: %s\n" "$path"
    failures=$((failures + 1))
  fi
}

warn_file() {
  local path="$1"
  if [ -f "$path" ]; then
    printf "ok   file: %s\n" "$path"
  else
    printf "warn optional file missing: %s\n" "$path"
  fi
}

check_dir() {
  local path="$1"
  if [ -d "$path" ]; then
    printf "ok   dir: %s\n" "$path"
  else
    printf "miss dir: %s\n" "$path"
    failures=$((failures + 1))
  fi
}

echo "Verifying macOS OpenClaw/Michael setup"
echo "Workspace: $WORKSPACE_DIR"
echo

check_cmd git
check_cmd node
check_cmd npm
check_cmd python3
check_cmd openclaw
check_cmd clawhub

echo
check_file "$WORKSPACE_DIR/AGENTS.md"
check_file "$WORKSPACE_DIR/SOUL.md"
check_file "$WORKSPACE_DIR/IDENTITY.md"
check_file "$WORKSPACE_DIR/USER.md"
check_file "$WORKSPACE_DIR/TOOLS.md"
warn_file "$WORKSPACE_DIR/.env.local"

echo
check_dir "$WORKSPACE_DIR/projects/experiments"
check_dir "$WORKSPACE_DIR/projects/active"
check_dir "$WORKSPACE_DIR/projects/archived"
check_dir "$WORKSPACE_DIR/memory"
check_dir "$WORKSPACE_DIR/.learnings"

echo
if [ "$failures" -eq 0 ]; then
  echo "Verification passed."
else
  echo "Verification found $failures issue(s)."
  exit 1
fi
