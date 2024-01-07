$VSConfigFile = "$env:USERPROFILE\sql2019.config"

$userAccount = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

$ErrorActionPreference = "Stop" 
# Set active path to script-location:
$path = $MyInvocation.MyCommand.Path
if (!$path) {$path = $psISE.CurrentFile.Fullpath}
if ($path)  {$path = Split-Path $path -Parent}
Set-Location $path

. ".\install_functions.ps1"


Write-Host "Installing VS..."
(echo "
[OPTIONS] 
IACCEPTSQLSERVERLICENSETERMS=`"True`"  
INSTANCENAME=`"SQL2019`" 
INSTANCEID=`"SQL2019`" 
ENU=`"True`" 
ACTION=`"Install`" 
quiet=`"True`" 
FEATURES=`"SQLEngine`" 
SQLSYSADMINACCOUNTS=`"$($userAccount)`" 
SECURITYMODE=`"SQL`" 
SAPWD=`"sapwd`" 
SQLCOLLATION=`"SQL_Latin1_General_CP1_CI_AS`"
") > $VSConfigFile
WingetInstall "Microsoft.SQLServer.2019.Developer" -e --override "/ConfigurationFile=$($VSConfigFile)"
Read-Host -Prompt "Done." | Out-Null