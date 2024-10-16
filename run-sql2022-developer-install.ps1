$VSConfigFile = "$env:USERPROFILE\sql2022.config"

$userAccount = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

$ErrorActionPreference = "Stop" 
# Set active path to script-location:
$path = $MyInvocation.MyCommand.Path
if (!$path) {$path = $psISE.CurrentFile.Fullpath}
if ($path)  {$path = Split-Path $path -Parent}
Set-Location $path

. ".\install_functions.ps1"

do {
    $pwd1 = Read-Host "Enter sa password" -AsSecureString
    $pwd2 = Read-Host "Re-enter sa password" -AsSecureString
    $pwd1_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pwd1))
    $pwd2_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pwd2))
}
while ($pwd1_text -ne $pwd2_text)

(echo "
[OPTIONS] 
INSTANCENAME=`"SQL2022`"
INSTANCEID=`"SQL2022`"
ACTION=`"Install`"
FEATURES=`"SQLEngine`"
SQLSYSADMINACCOUNTS=`"$($userAccount)`"
SECURITYMODE=`"SQL`"
SAPWD=`"$($pwd1_text)`"
SQLCOLLATION=`"SQL_Latin1_General_CP1_CI_AS`"
") > $VSConfigFile
WingetInstall "Microsoft.SQLServer.2022.Developer" --override "/q /IACCEPTSQLSERVERLICENSETERMS /ENU /ConfigurationFile=$($VSConfigFile)"
Read-Host -Prompt "Done. Please restart if installer failed with exit code: 3010" | Out-Null
