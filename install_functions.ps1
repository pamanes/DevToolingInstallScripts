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
    $exists = (winget list --id "$($id)" --accept-source-agreements) -match '^(\p{L}|-)' -like "*$($id)*"
    $exists
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