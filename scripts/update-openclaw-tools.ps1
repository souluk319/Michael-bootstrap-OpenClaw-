$ErrorActionPreference = "Stop"

$Tools = @("openclaw", "clawhub")

function Write-Step($Message) {
  Write-Host ""
  Write-Host "==> $Message" -ForegroundColor Cyan
}

function Test-Command($Name) {
  return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Get-InstalledNpmVersion($Package) {
  $Output = npm list -g $Package --depth=0 2>$null
  $Pattern = [regex]::Escape($Package) + "@(.+)$"

  foreach ($Line in $Output) {
    if ($Line -match $Pattern) {
      return $Matches[1]
    }
  }

  return "not installed"
}

function Get-LatestNpmVersion($Package) {
  try {
    return (npm view $Package version 2>$null)
  } catch {
    return "unknown"
  }
}

function Show-Versions($Label) {
  Write-Step $Label

  foreach ($Tool in $Tools) {
    $Current = Get-InstalledNpmVersion $Tool
    $Latest = Get-LatestNpmVersion $Tool
    Write-Host ("{0,-8} current: {1}  latest: {2}" -f $Tool, $Current, $Latest)
  }
}

if (-not (Test-Command "npm")) {
  throw "npm is required. Install Node.js first, then rerun this script."
}

Show-Versions "Before update"

Write-Step "Installing latest OpenClaw npm tools"
npm install -g openclaw@latest clawhub@latest

Show-Versions "After update"

Write-Step "Update complete"
