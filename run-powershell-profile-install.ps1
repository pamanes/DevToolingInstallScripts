$ErrorActionPreference = "Stop" 

$pShellProfilePath = "$env:USERPROFILE\PowerShell"
$pShellProfileFile = "$($pShellProfilePath)\Microsoft.PowerShell_profile.ps1"

		if(!(test-path $pShellProfilePath))
        {			
			Write-Host "Creating PowerShell profile folder"
			New-Item -ItemType "directory" -Path $pShellProfilePath
        }

		if(-not (Test-Path $pShellProfileFile))
		{
			Write-Host "Creating PowerShell profile file"
			(echo "
function fnNPP{
		& `"C:\Program Files\Notepad++\Notepad++.exe`" @args | Out-Null
	
}

Set-Alias -Name npp -Value fnNPP") > $pShellProfileFile
		}
		else
		{			
			Write-Host "file already exists..."
		}
		Read-Host -Prompt "Done." | Out-Null