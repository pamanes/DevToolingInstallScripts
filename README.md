# DevToolingInstallScripts
Collection of powershell scripts to get dev tooling ready

- run powershell as admin before running any scripts and execute the following:
  
	**Set-ExecutionPolicy -ExecutionPolicy RemoteSigned**

- Right-click on each .ps1 file and click Properties, make sure to Unblock them before executing them
  
- Only the scripts prefixed with "run" can be executed for installing programs, right-click the script and choose "Run with PowerShell"

- First run the "run-winget-install-latest.ps1", since most programs are installed with winget. Winget is already installed on Windows 11.

- If you're installing docker, make sure you run "run-wsl-install" first, docker requires WSL, then run "run-docker-install"
