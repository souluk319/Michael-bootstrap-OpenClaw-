# New Machine Checklist

## Before running bootstrap

- Know whether the machine is macOS or Windows.
- Make sure the user account has permission to install packages.
- Confirm internet connection.
- Confirm GitHub access to the private bootstrap repo.

## Run bootstrap

macOS:

```bash
bash scripts/bootstrap-macos.sh
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\bootstrap-windows.ps1
```

## Verify

macOS:

```bash
bash scripts/verify-macos.sh
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify-windows.ps1
```

## Keep OpenClaw tools current

Fresh bootstrap installs `openclaw@latest` and `clawhub@latest`.
To update an existing machine later, run:

macOS:

```bash
bash scripts/update-openclaw-tools.sh
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\update-openclaw-tools.ps1
```

## Confirm workspace files

Check:

- `AGENTS.md`
- `SOUL.md`
- `IDENTITY.md`
- `USER.md`
- `TOOLS.md`
- `.env.local`
- `projects/experiments`
- `projects/active`
- `projects/archived`
- `memory`
- `.learnings`

## Connect auth

- GitHub
- Gmail
- Google Workspace
- OpenAI
- iMessage if macOS
- deployment accounts only when needed

## First OpenClaw test

Ask Michael:

```text
너 지금 누구야?
```

Expected:

- Michael identity is loaded.
- Tone matches 성욱's workspace rules.
- No secret/auth values are printed.

## First coding test

Run:

```bash
node -v
npm -v
python3 --version
git --version
```

On Windows, use:

```powershell
node -v
npm -v
python --version
git --version
```
