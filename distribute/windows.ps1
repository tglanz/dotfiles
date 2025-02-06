param(
  [string]$localappdata
)

$script_dir = $PSScriptRoot
$dotfiles_dir = Resolve-Path "$script_dir/.."

$adminGroup = [System.Security.Principal.WindowsBuiltInRole]::Administrator
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$currentUserGroups = $currentUser.Groups
$adminIdentifier = New-Object System.Security.Principal.SecurityIdentifier("S-1-5-32-544")
$isAdmin = $currentUserGroups -contains ($adminIdentifier)

if (!$localappdata) {
  $localappdata = $env:LOCALAPPDATA
}

if (-not $isAdmin) {
    # Relaunch the script as administrator
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" -localappdata $localappdata" -Verb RunAs
    Write-Host "Running: $PSCommandPath -localappdata=$localappdata"
    exit  # Exit the current script after launching the elevated one
}


"Running as admin"
New-Item -ItemType SymbolicLink -Path "$localappdata\nvim" -Target "$dotfiles_dir\nvim"
