$ErrorActionPreference = "Stop" 
# Set active path to script-location:
$path = $MyInvocation.MyCommand.Path
if (!$path) {$path = $psISE.CurrentFile.Fullpath}
if ($path)  {$path = Split-Path $path -Parent}
Set-Location $path

. ".\install_functions.ps1"


if((Check-WingetInstall "Microsoft.VisualStudioCode") -eq $false)
{
	Write-Host "Please Install VSCode first"
	Read-Host -Prompt "Done." | Out-Null
}
else
{
	code --install-extension amazonwebservices.amazon-q-vscode
	code --install-extension Angular.ng-template --force 
	code --install-extension dbaeumer.vscode-eslint --force 
	code --install-extension eamodio.gitlens --force 
	code --install-extension ms-dotnettools.csdevkit --force 
	code --install-extension ms-dotnettools.csharp --force 
	code --install-extension ms-dotnettools.vscode-dotnet-runtime --force 
	code --install-extension ms-dotnettools.vscodeintellicode-csharp --force 
	code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools --force 
	code --install-extension redhat.vscode-yaml --force 
	code --install-extension ria.elastic --force 
	code --install-extension tht13.html-preview-vscode --force 
}

Read-Host -Prompt "Done." | Out-Null
