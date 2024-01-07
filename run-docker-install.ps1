$ErrorActionPreference = "Stop" 
# Set active path to script-location:
$path = $MyInvocation.MyCommand.Path
if (!$path) {$path = $psISE.CurrentFile.Fullpath}
if ($path)  {$path = Split-Path $path -Parent}
Set-Location $path

. ".\install_functions.ps1"


WingetInstall "Docker.DockerDesktop"
Read-Host -Prompt "Press ENTER to RESTART..." | Out-Null
Write-Host "Restarting..."
sleep 3
Restart-Computer -Force