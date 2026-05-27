$ErrorActionPreference = "Stop" 
# Set active path to script-location:
$path = $MyInvocation.MyCommand.Path
if (!$path) {$path = $psISE.CurrentFile.Fullpath}
if ($path)  {$path = Split-Path $path -Parent}
Set-Location $path

. ".\install_functions.ps1"

WingetInstall -e --id CoreyButler.NVMforWindows
# After installing, for angular 18 execute the following:
# nvm install 20.19.3
# nvm use 20.19.3

Read-Host -Prompt "Done." | Out-Null
