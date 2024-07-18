﻿$ErrorActionPreference = "Stop" 
# Set active path to script-location:
$path = $MyInvocation.MyCommand.Path
if (!$path) {$path = $psISE.CurrentFile.Fullpath}
if ($path)  {$path = Split-Path $path -Parent}
Set-Location $path

. ".\install_functions.ps1"


WingetInstall "OpenJS.NodeJS" -e -v 16.10.0 
Read-Host -Prompt "Done." | Out-Null
