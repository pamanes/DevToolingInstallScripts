# DevToolingInstallScripts
Collection of powershell scripts to get dev tooling ready

- run powershell as admin before running any scripts and execute the following (Administrator rights required for some scripts):
  
	**Set-ExecutionPolicy -ExecutionPolicy RemoteSigned**
- Make sure winget is installed by running command **winget** in terminal or powershell, if not installed you can install from here: https://github.com/microsoft/winget-cli

- Right-click on each .ps1 file and click Properties, make sure to Unblock them before executing them
  
- Only the scripts prefixed with "run" can be executed for installing programs, right-click the script and choose "Run with PowerShell"

- First run the "run-winget-install-latest.ps1", since most programs are installed with winget. Winget is already installed on Windows 11.

- If you're installing docker, make sure you run "run-wsl-install" first, docker requires WSL, then run "run-docker-install". After installing Docker, open Powershell as Administrator and execute the following: **bcdedit /set hypervisorlaunchtype auto** and restart your computer.

- If run-vscode-extensions-install.ps1 throws certificate errors, disable your VPN or internet security before running and try again
