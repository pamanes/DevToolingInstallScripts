param(
  [switch]$PostRestart
)

$ErrorActionPreference = "Stop" 
# Get the ID and security principal of the current user account
$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent();
$myWindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal($myWindowsID);


 # Get the security principal for the Administrator role
 $adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

 # Check to see if we are currently running "as Administrator"
 if ($myWindowsPrincipal.IsInRole($adminRole))
{
	# We are running "as Administrator" - so change the title and background color to indicate this
	$Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
	$Host.UI.RawUI.BackgroundColor = "DarkBlue"
	clear-host
}
else
{
	# We are not running "as Administrator" - so relaunch as administrator

	# Create a new process object that starts PowerShell
	$newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";

	# Specify the current script path and name as a parameter
	$newProcess.Arguments = $myInvocation.MyCommand.Definition;

	# Indicate that the process should be elevated
	$newProcess.Verb = "runas";

	# Start the new process
	[System.Diagnostics.Process]::Start($newProcess);

	# Exit from the current, unelevated, process
	exit
}

# Set active path to script-location:
$path = $MyInvocation.MyCommand.Path
if (!$path) {$path = $psISE.CurrentFile.Fullpath}
if ($path)  {$path = Split-Path $path -Parent}
Set-Location $path

. ".\install_functions.ps1"

Remove-StartupTask

if (-not $PostRestart) 
{
    Write-Host "Launching WSL install..."
    $wslInstall = Start-Process -FilePath wsl.exe -ArgumentList "--install -d Ubuntu --no-launch" -Wait -PassThru
    Set-StartupTask $PSCommandPath
    Read-Host -Prompt "Wait WSL to finish setup, then press ENTER to RESTART..." | Out-Null
    Write-Host "Restarting"
    Restart-Computer -Force
}
else 
{
    Write-Host "Starting wsl..."
    Write-Host "Wait for WSL to finish setup, then create username and password to login, then close WSL window to finish this script."
    Start-Process -FilePath ubuntu.exe -Wait -PassThru
	Read-Host -Prompt "Done." | Out-Null
}