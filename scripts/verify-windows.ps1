$ErrorActionPreference = "Stop"

$WorkspaceDir = if ($env:OPENCLAW_WORKSPACE_DIR) { $env:OPENCLAW_WORKSPACE_DIR } else { Join-Path $env:USERPROFILE ".openclaw\workspace" }
$Failures = 0

function Check-Command($Name) {
  $Cmd = Get-Command $Name -ErrorAction SilentlyContinue
  if ($Cmd) {
    Write-Host "ok   command: $Name -> $($Cmd.Source)"
  } else {
    Write-Host "miss command: $Name" -ForegroundColor Red
    $script:Failures += 1
  }
}

function Check-File($Path) {
  if (Test-Path $Path -PathType Leaf) {
    Write-Host "ok   file: $Path"
  } else {
    Write-Host "miss file: $Path" -ForegroundColor Red
    $script:Failures += 1
  }
}

function Warn-File($Path) {
  if (Test-Path $Path -PathType Leaf) {
    Write-Host "ok   file: $Path"
  } else {
    Write-Host "warn optional file missing: $Path" -ForegroundColor Yellow
  }
}

function Check-Dir($Path) {
  if (Test-Path $Path -PathType Container) {
    Write-Host "ok   dir: $Path"
  } else {
    Write-Host "miss dir: $Path" -ForegroundColor Red
    $script:Failures += 1
  }
}

Write-Host "Verifying Windows OpenClaw/Michael setup"
Write-Host "Workspace: $WorkspaceDir"
Write-Host ""

Check-Command "git"
Check-Command "node"
Check-Command "npm"
Check-Command "python"
Check-Command "openclaw"
Check-Command "clawhub"

Write-Host ""
Check-File (Join-Path $WorkspaceDir "AGENTS.md")
Check-File (Join-Path $WorkspaceDir "SOUL.md")
Check-File (Join-Path $WorkspaceDir "IDENTITY.md")
Check-File (Join-Path $WorkspaceDir "USER.md")
Check-File (Join-Path $WorkspaceDir "TOOLS.md")
Warn-File (Join-Path $WorkspaceDir ".env.local")

Write-Host ""
Check-Dir (Join-Path $WorkspaceDir "projects\experiments")
Check-Dir (Join-Path $WorkspaceDir "projects\active")
Check-Dir (Join-Path $WorkspaceDir "projects\archived")
Check-Dir (Join-Path $WorkspaceDir "memory")
Check-Dir (Join-Path $WorkspaceDir ".learnings")

Write-Host ""
if ($Failures -eq 0) {
  Write-Host "Verification passed." -ForegroundColor Green
} else {
  Write-Host "Verification found $Failures issue(s)." -ForegroundColor Red
  exit 1
}
