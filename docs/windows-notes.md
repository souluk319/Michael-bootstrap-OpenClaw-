# Windows Notes

Windows bootstrap is a first-pass installer.

## What should work

- Git installation through winget
- Node.js installation through winget
- Python installation through winget
- npm global install of `openclaw` and `clawhub`
- workspace folder creation
- Michael config file copy
- basic verification

## What may need manual work

- PowerShell execution policy
- PATH refresh after Node/Python install
- OpenClaw platform-specific behavior
- iMessage is not available on Windows
- macOS-only tools and skills are unavailable

## Recommended Windows mode

Use Windows for:

- coding
- GitHub
- web projects
- OpenClaw text work
- repo management

Use macOS for:

- iMessage
- Apple Notes/Reminders
- Messages.app automation
- macOS UI automation

## If npm is unavailable after install

Close PowerShell and reopen it.

Then run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\bootstrap-windows.ps1
```

