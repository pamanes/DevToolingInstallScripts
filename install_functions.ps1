#install_functions
$taskName = "PostRestartScript"

function WingetInstall($id){

    if((Check-WingetInstall "$($id)") -eq $false)
    {
        Write-Host "Installing $($id)..."
        winget install --accept-source-agreements --accept-package-agreements --id $id @args
    }
    else
    {
        Write-Host "$($id) already installed"
    }
}

function Check-WingetInstall($id)
{
    if (-not (Get-WingetStatus)) 
    {
        Write-Warning "winget is not installed, exiting..."
        Write-Warning "If you want to install winget, execute run-winget-install-latest.ps1 first."
        ExitWithDelay 0 5 
    }

    $exists = (winget list --id "$($id)" --accept-source-agreements) -match '^(\p{L}|-)' -like "*$($id)*"
    if($exists.Length -gt 0)
    {
        return $true
    }
    else
    {
        return $false
    }
}

#Creates a task scheduler entry to continue running the script at logon
function Set-StartupTask($install_file) {
    $taskAction = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-executionpolicy bypass -noprofile -file $install_file -PostRestart"
    $taskTrigger = New-ScheduledTaskTrigger -AtLogOn
    Register-ScheduledTask -TaskName $taskName -RunLevel Highest -Action $taskAction -User $env:USERNAME -Trigger $taskTrigger -Force    
}

function Remove-StartupTask {
    $task = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
    if ($task -ne $null)
    {
        Unregister-ScheduledTask -TaskName $taskName -Confirm:$false 
    }
}

function ExitWithDelay {
    param (
        [int]$ExitCode,
        [int]$Seconds = 10
    )

    # Waiting for x seconds output
    Start-Sleep -Seconds $Seconds

    # Exit the script with error code
    # Some systems may accidentally close the window, but that's a PowerShell bug
    # https://stackoverflow.com/questions/67593504/why-wont-the-exit-function-work-in-my-powershell-code
    Exit $ExitCode
}

function Get-WingetStatus {

    # Check if winget is installed
    $winget = Get-Command -Name winget -ErrorAction SilentlyContinue

    # If winget is installed, return $true
    if ($null -ne $winget) {
        return $true
    }

    # If winget is not installed, return $false
    return $false
}