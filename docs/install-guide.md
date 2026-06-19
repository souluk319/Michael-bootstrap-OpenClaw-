# Install Guide

## Goal

Install OpenClaw and Michael's workspace setup on a fresh macOS or Windows machine.

## macOS

Run:

```bash
git clone <repo-url> michael-bootstrap
cd michael-bootstrap
bash scripts/bootstrap-macos.sh
bash scripts/verify-macos.sh
```

Success looks like:

```text
Verification passed.
```

If `git` is missing, run:

```bash
xcode-select --install
```

Then rerun the bootstrap script.

## Windows

Open PowerShell.

Run:

```powershell
git clone <repo-url> michael-bootstrap
cd michael-bootstrap
powershell -ExecutionPolicy Bypass -File .\scripts\bootstrap-windows.ps1
powershell -ExecutionPolicy Bypass -File .\scripts\verify-windows.ps1
```

Success looks like:

```text
Verification passed.
```

If `npm` is unavailable after Node.js installation, close and reopen PowerShell, then rerun the script.

## Updating an existing machine

macOS:

```bash
bash scripts/sync-workspace.sh
```

Windows:

For now, rerun `bootstrap-windows.ps1`. It backs up existing workspace files before copying new templates.

## What this does not do

It does not automatically authenticate:

- Gmail
- GitHub
- Google Workspace
- Apple/iMessage
- OpenAI
- Vercel
- Render
- Supabase

See `secrets-and-auth.md`.

