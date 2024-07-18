# DevToolingInstallScripts
Collection of powershell scripts to get dev tooling ready

- run powershell as admin before running any scripts and execute the following (Administrator rights required for some scripts):
  
	**Set-ExecutionPolicy -ExecutionPolicy RemoteSigned**
- Make sure winget is installed by running command **winget** in terminal or powershell, if not installed you can install from here: https://github.com/microsoft/winget-cli

- Right-click on each .ps1 file and click Properties, if they show as blocked make sure to Unblock them before executing them, this depends on your group policy for downloading files from the internet.
  
- Only the scripts prefixed with "run" can be executed for installing programs, right-click the script and choose "Run with PowerShell"

- If you're installing docker, make sure you run "run-wsl-install" first, docker requires WSL, then run "run-docker-install". After installing Docker, open Powershell as Administrator and execute the following: **bcdedit /set hypervisorlaunchtype auto** and restart your computer.

- If run-vscode-extensions-install.ps1 throws certificate errors, disable your VPN or internet security before running and try again

- Windows Terminal and Winget are already on the latest version of Windows 11. If you are using Windows 10 you may need to install them manually.
