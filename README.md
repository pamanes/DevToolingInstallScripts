# DevToolingInstallScripts
Collection of powershell scripts to get dev tooling ready

# Install Option #1 (winget configure)

- Open Terminal as Administrator, navigate to winget_configure/.configurations folder and run **winget configure .\configuration.dsc.yaml --verbose-logs**
- This will install: Notepad++, NPM (16.10.0), Powershell, Git, SSMS, Azure CLI, PostgreSQL 16, Postman, WSL, Ubuntu, Docker Desktop, VS2022 Professional (with workloads/components), and VSCode (without extentions)
- Restart your computer
- Open Ubuntu, you should get "Installing, this may take a few minutes...", wait for install to finish and enter Ubuntu username, and password when prompted.
- Open Docker Desktop -> Settings and make sure Docker Desktop is using WSL (see final steps below for screenshot)
- To install the rest of the programs, like SQL Server, JMeter, VSCode Extensions, AWS CLI V2, etc:

	- Run in terminal as admin: **Set-ExecutionPolicy -ExecutionPolicy RemoteSigned**
	- Make sure all ps1 files are unblocked: Get-ChildItem "C:\Path\To\DevToolingInstallScripts" -Recurse | Unblock-File 
	- Right-click the install file, for example **run-install-sql2019.ps1** and click Run with Powershell
	- If run-vscode-extensions-install.ps1 throws certificate errors, disable your VPN or internet security before running and try again
  
# Install Option #2 (execute run-install*.ps1 files manually)

- Powershell and Winget are required to run these scripts, they are already installed on Windows 11. If you are using Windows 10 you may need to install them manually, for winget look here: https://github.com/microsoft/winget-cli

- Run powershell as admin before running any scripts and execute the following (Administrator rights required for some scripts):
  
	**Set-ExecutionPolicy -ExecutionPolicy RemoteSigned**

- Right-click on each .ps1 file and click Properties, if they show as blocked make sure to Unblock them before executing them with **Get-ChildItem "C:\Path\To\DevToolingInstallScripts" -Recurse | Unblock-File**, this depends on your group policy for downloading files from the internet.
  
- Only the scripts prefixed with "run" can be executed for installing programs, right-click the script and choose "Run with PowerShell"

- If installing Docker, make sure to install wsl first, then docker.

- If run-vscode-extensions-install.ps1 throws certificate errors, disable your VPN or internet security before running and try again

# Final Steps

- If you installed WSL/Docker, open Terminal/Powershell as Administrator and execute the following: **bcdedit /set hypervisorlaunchtype auto** and restart your computer.
- Make sure Docker is using WSL by going to Docker Desktop -> Settings: ![Alt text](/docker_desktop_wsl.png?raw=true "Docker using WSL")
