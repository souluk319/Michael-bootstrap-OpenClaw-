$ErrorActionPreference = "Stop"

$RootDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$WorkspaceDir = if ($env:OPENCLAW_WORKSPACE_DIR) { $env:OPENCLAW_WORKSPACE_DIR } else { Join-Path $env:USERPROFILE ".openclaw\workspace" }
$BackupDir = Join-Path $WorkspaceDir (".bootstrap-backups\" + (Get-Date -Format "yyyyMMdd-HHmmss"))

function Write-Step($Message) {
  Write-Host ""
  Write-Host "==> $Message" -ForegroundColor Cyan
}

function Test-Command($Name) {
  return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Backup-IfExists($Path) {
  if (Test-Path $Path) {
    New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null
    Copy-Item -Recurse -Force $Path $BackupDir
  }
}

function Install-WingetPackage($Id) {
  if (-not (Test-Command "winget")) {
    Write-Warning "winget is not available. Install $Id manually."
    return
  }

  winget install --id $Id --silent --accept-package-agreements --accept-source-agreements
}

function Copy-WorkspaceFile($Name) {
  $Source = Join-Path $RootDir "config\workspace\$Name"
  $Target = Join-Path $WorkspaceDir $Name

  if (-not (Test-Path $Source)) {
    throw "missing template: $Source"
  }

  Backup-IfExists $Target
  Copy-Item -Force $Source $Target
}

Write-Step "Preparing OpenClaw workspace"
New-Item -ItemType Directory -Force -Path $WorkspaceDir | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $WorkspaceDir "projects\experiments") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $WorkspaceDir "projects\active") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $WorkspaceDir "projects\archived") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $WorkspaceDir "memory") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $WorkspaceDir ".learnings") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $WorkspaceDir "skills") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $WorkspaceDir "briefings") | Out-Null

Write-Step "Installing base packages with winget when needed"
if (-not (Test-Command "git")) { Install-WingetPackage "Git.Git" }
if (-not (Test-Command "node")) { Install-WingetPackage "OpenJS.NodeJS.LTS" }
if (-not (Test-Command "python")) { Install-WingetPackage "Python.Python.3.12" }

Write-Step "Checking npm"
if (-not (Test-Command "npm")) {
  throw "npm is unavailable. Restart PowerShell after Node.js install, then rerun this script."
}

Write-Step "Installing latest OpenClaw npm tools"
npm install -g openclaw@latest clawhub@latest

Write-Step "Copying Michael workspace files"
Copy-WorkspaceFile "AGENTS.md"
Copy-WorkspaceFile "SOUL.md"
Copy-WorkspaceFile "IDENTITY.md"
Copy-WorkspaceFile "USER.md"
Copy-WorkspaceFile "TOOLS.md"

$EnvTarget = Join-Path $WorkspaceDir ".env.local"
if (-not (Test-Path $EnvTarget)) {
  Copy-Item -Force (Join-Path $RootDir "templates\.env.example") $EnvTarget
}

Write-Step "Bootstrap complete"
Write-Host "Workspace: $WorkspaceDir"
Write-Host "Backups: $BackupDir"
Write-Host ""
Write-Host "Next:"
Write-Host "  powershell -ExecutionPolicy Bypass -File .\scripts\verify-windows.ps1"
Write-Host "  Read docs\secrets-and-auth.md"
