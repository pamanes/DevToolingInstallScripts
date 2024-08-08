# DevToolingInstallScripts
Collection of powershell scripts to get dev tooling ready

- Powershell and Winget are required to run these scripts, they are already installed on Windows 11. If you are using Windows 10 you may need to install them manually, for winget look here: https://github.com/microsoft/winget-cli

- Run powershell as admin before running any scripts and execute the following (Administrator rights required for some scripts):
  
	**Set-ExecutionPolicy -ExecutionPolicy RemoteSigned**

- Right-click on each .ps1 file and click Properties, if they show as blocked make sure to Unblock them before executing them, this depends on your group policy for downloading files from the internet.
  
- Only the scripts prefixed with "run" can be executed for installing programs, right-click the script and choose "Run with PowerShell"

- If you're installing docker, make sure you run "run-wsl-install" first, docker requires WSL, then run "run-docker-install". After installing Docker, open Powershell as Administrator and execute the following: **bcdedit /set hypervisorlaunchtype auto** and restart your computer.

- If run-vscode-extensions-install.ps1 throws certificate errors, disable your VPN or internet security before running and try again
