$homePath = "$env:UserProfile"
$oneDrivePath = "$env:OneDriveCommercial"
$documentsPath = Join-Path $oneDrivePath "Documents"
$toolingPath = Join-Path $documentsPath "Tooling"

if((Test-Path $homePath) -and (Test-Path $oneDrivePath) -and (Test-Path $documentsPath))
{
	if((Test-Path $toolingPath) -eq $false)
	{
		Write-Host "Creating Tooling path."
		New-Item -ItemType Directory -Path $toolingPath
	}
	else
	{
		Write-Host "Tooling path already exists."
	}
	
	if((Test-Path $toolingPath) -eq $true)
	{
		Set-Location $toolingPath
        Write-Host "Downloading..."
        $downloadUri = (irm https://api.github.com/repos/paolosalvatori/ServiceBusExplorer/releases/latest).assets.browser_download_url[0]
        if([string]::IsNullOrWhiteSpace($downloadUri) -eq $true)
        {
            throw "Error downloading uri"
        }

		if(([string]::IsNullOrWhiteSpace($downloadUri) -eq $false) -and ($downloadUri.Contains(".zip")))
		{
			$fileName = [System.IO.Path]::GetFileNameWithoutExtension($downloadUri)
			$zipName = [System.IO.Path]::GetFileName($downloadUri);
			Invoke-WebRequest -Uri $downloadUri -OutFile $zipName			
			if((Test-Path $zipName) -eq $true)
			{
				Remove-Item -Recurse $zipName
			}
			if((Test-Path $fileName) -eq $false)
			{
				Write-Host "Expanding..."
				Expand-Archive $zipName -DestinationPath $fileName 
			}			
			else
			{
				Write-Host "destination path already exists"
			}
			
			Pop-Location
		}
		else
		{
			throw "Cannot locate file"
		}
	}
}
else
{
	throw "Paths not found"
}
