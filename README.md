# michael-bootstrap

One-touch bootstrap kit for installing OpenClaw and Michael's workspace setup on a new Mac or Windows PC.

## Purpose

This repo helps 성욱 attach `Michael` to a fresh machine with the same working rules, workspace structure, and verification checklist.

It does **not** store secrets.

Do not commit:

- API keys
- OAuth tokens
- Apple account credentials
- Gmail tokens
- GitHub tokens
- production `.env` files
- local message databases

## Supported targets

- macOS: first-class MVP
- Windows: first-pass PowerShell installer

Windows support is designed for basic OpenClaw/workspace setup. Some Apple-specific features such as iMessage are macOS-only.

## Quick start

### macOS

```bash
git clone <repo-url> michael-bootstrap
cd michael-bootstrap
bash scripts/bootstrap-macos.sh
```

### Windows PowerShell

```powershell
git clone <repo-url> michael-bootstrap
cd michael-bootstrap
powershell -ExecutionPolicy Bypass -File .\scripts\bootstrap-windows.ps1
```

## What it installs or checks

- Git
- Node.js
- Python
- OpenClaw npm package
- ClawHub npm package
- Michael workspace files
- Standard workspace folders
- Local env template

## Workspace target

Default workspace path:

```text
~/.openclaw/workspace
```

On Windows:

```text
%USERPROFILE%\.openclaw\workspace
```

## Included Michael files

The bootstrap copies these files into the new workspace:

- `AGENTS.md`
- `SOUL.md`
- `IDENTITY.md`
- `USER.md`
- `TOOLS.md`

Existing files are backed up before replacement.

## After bootstrap

Run verification:

### macOS

```bash
bash scripts/verify-macos.sh
```

### Windows

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify-windows.ps1
```

Then connect auth manually:

- GitHub CLI
- Gmail connector or `gog`
- OpenAI/API keys
- iMessage/macOS permissions if needed
- Vercel/Render/Supabase project credentials when needed

See `docs/secrets-and-auth.md`.

## Current status

- Bootstrap project scaffolded
- macOS installer added
- Windows installer added
- workspace config templates copied
- verification scripts added
- GitHub push intentionally not done yet

