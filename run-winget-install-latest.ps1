# Download latest dotnet/codeformatter release from github
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

$repo = "asheroto/winget-install"
$file = "winget-install.ps1"

$releases = "https://api.github.com/repos/$repo/releases"

Write-Host Determining latest release
$tag = (Invoke-WebRequest $releases | ConvertFrom-Json)[0].tag_name
$download = "https://github.com/$repo/releases/download/$tag/$file"

Write-Host "Dowloading $($tag) release"

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $download -out $file

& ".\$($file)"