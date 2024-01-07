﻿$VSConfigFile = "$env:USERPROFILE\vs2022.config"

$ErrorActionPreference = "Stop" 
# Set active path to script-location:
$path = $MyInvocation.MyCommand.Path
if (!$path) {$path = $psISE.CurrentFile.Fullpath}
if ($path)  {$path = Split-Path $path -Parent}
Set-Location $path

. ".\install_functions.ps1"


Write-Host "Installing VS..."
(echo "{ 
	`"version`": `"1.0`", 
	`"components`": [ 
	`"Microsoft.VisualStudio.Component.DependencyValidation.Community`", 
	`"Microsoft.VisualStudio.Component.CoreEditor`", 
	`"Microsoft.VisualStudio.Workload.CoreEditor`", 
	`"Microsoft.Net.Component.4.8.SDK`", 
	`"Microsoft.Net.Component.4.7.2.TargetingPack`", 
	`"Microsoft.Net.ComponentGroup.DevelopmentPrerequisites`", 
	`"Microsoft.VisualStudio.Component.TypeScript.TSServer`", 
	`"Microsoft.VisualStudio.ComponentGroup.WebToolsExtensions`", 
	`"Microsoft.VisualStudio.Component.JavaScript.TypeScript`", 
	`"Microsoft.VisualStudio.Component.JavaScript.Diagnostics`", 
	`"Microsoft.VisualStudio.Component.Roslyn.Compiler`", 
	`"Microsoft.Component.MSBuild`", 
	`"Microsoft.VisualStudio.Component.Roslyn.LanguageServices`", 
	`"Microsoft.VisualStudio.Component.TextTemplating`", 
	`"Component.Microsoft.VisualStudio.RazorExtension`", 
	`"Microsoft.VisualStudio.Component.IISExpress`", 
	`"Microsoft.VisualStudio.Component.NuGet`", 
	`"Microsoft.VisualStudio.Component.MSODBC.SQL`", 
	`"Microsoft.VisualStudio.Component.SQL.LocalDB.Runtime`", 
	`"Microsoft.VisualStudio.Component.Common.Azure.Tools`", 
	`"Microsoft.VisualStudio.Component.SQL.CLR`", 
	`"Microsoft.VisualStudio.Component.MSSQL.CMDLnUtils`", 
	`"Microsoft.Component.ClickOnce`", 
	`"Microsoft.VisualStudio.Component.ManagedDesktop.Core`", 
	`"Microsoft.VisualStudio.Component.SQL.SSDT`", 
	`"Microsoft.VisualStudio.Component.SQL.DataSources`", 
	`"Component.Microsoft.Web.LibraryManager`", 
	`"Component.Microsoft.WebTools.BrowserLink.WebLivePreview`", 
	`"Microsoft.VisualStudio.ComponentGroup.Web`", 
	`"Microsoft.NetCore.Component.Runtime.8.0`", 
	`"Microsoft.NetCore.Component.SDK`", 
	`"Microsoft.VisualStudio.Component.FSharp`", 
	`"Microsoft.ComponentGroup.ClickOnce.Publish`", 
	`"Microsoft.NetCore.Component.DevelopmentTools`", 
	`"Microsoft.VisualStudio.Component.FSharp.WebTemplates`", 
	`"Microsoft.VisualStudio.Component.DockerTools`", 
	`"Microsoft.NetCore.Component.Web`", 
	`"Microsoft.VisualStudio.Component.WebDeploy`", 
	`"Microsoft.VisualStudio.Component.AppInsights.Tools`", 
	`"Microsoft.VisualStudio.Component.Web`", 
	`"Microsoft.Net.Component.4.8.TargetingPack`", 
	`"Microsoft.Net.ComponentGroup.4.8.DeveloperTools`", 
	`"Microsoft.VisualStudio.Component.AspNet45`", 
	`"Microsoft.VisualStudio.Component.AspNet`", 
	`"Component.Microsoft.VisualStudio.Web.AzureFunctions`", 
	`"Microsoft.VisualStudio.ComponentGroup.AzureFunctions`", 
	`"Microsoft.VisualStudio.ComponentGroup.Web.CloudTools`", 
	`"Microsoft.VisualStudio.Component.DiagnosticTools`", 
	`"Microsoft.VisualStudio.Component.EntityFramework`", 
	`"Microsoft.VisualStudio.Component.Debugger.JustInTime`", 
	`"Component.Microsoft.VisualStudio.LiveShare.2022`", 
	`"Microsoft.VisualStudio.Component.WslDebugging`", 
	`"Microsoft.VisualStudio.Component.IntelliCode`", 
	`"Microsoft.VisualStudio.Workload.NetWeb`", 
	`"Microsoft.VisualStudio.Component.Azure.ClientLibs`", 
	`"Microsoft.VisualStudio.ComponentGroup.Azure.Prerequisites`", 
	`"Microsoft.Component.Azure.DataLake.Tools`", 
	`"Microsoft.VisualStudio.Component.Azure.ResourceManager.Tools`", 
	`"Microsoft.VisualStudio.ComponentGroup.Azure.ResourceManager.Tools`", 
	`"Microsoft.VisualStudio.Component.Azure.AuthoringTools`", 
	`"Microsoft.VisualStudio.Component.Azure.Waverton.BuildTools`", 
	`"Microsoft.VisualStudio.Component.Azure.Compute.Emulator`", 
	`"Microsoft.VisualStudio.Component.Azure.Waverton`", 
	`"Microsoft.VisualStudio.ComponentGroup.Azure.CloudServices`", 
	`"Microsoft.VisualStudio.Component.Azure.ServiceFabric.Tools`", 
	`"Microsoft.VisualStudio.Component.Azure.Powershell`", 
	`"Microsoft.VisualStudio.Workload.Azure`", 
	`"Microsoft.VisualStudio.Component.ManagedDesktop.Prerequisites`", 
	`"Microsoft.VisualStudio.Component.DotNetModelBuilder`", 
	`"Microsoft.VisualStudio.Workload.ManagedDesktop`", 
	`"Microsoft.VisualStudio.Workload.Data`" 
	] 
}") > $VSConfigFile
WingetInstall "Microsoft.VisualStudio.2022.Community" --source winget --exact --override "--passive --config $($VSConfigFile)"
Read-Host -Prompt "Done." | Out-Null