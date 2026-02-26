$VSConfigFile = "$env:USERPROFILE\vs2022.config"

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
    `"Component.Microsoft.VisualStudio.LiveShare.2022`",
    `"Component.Microsoft.VisualStudio.RazorExtension`",
    `"Component.Microsoft.VisualStudio.Web.AzureFunctions`",
    `"Component.Microsoft.Web.LibraryManager`",
    `"Component.Microsoft.WebTools.BrowserLink.WebLivePreview`",
    `"Microsoft.Component.Azure.DataLake.Tools`",
    `"Microsoft.Component.ClickOnce`",
    `"Microsoft.Component.MSBuild`",
    `"Microsoft.ComponentGroup.ClickOnce.Publish`",
    `"Microsoft.Net.Component.4.7.2.TargetingPack`",
    `"Microsoft.Net.Component.4.8.SDK`",
    `"Microsoft.Net.Component.4.8.TargetingPack`",
    `"Microsoft.Net.ComponentGroup.4.8.DeveloperTools`",
    `"Microsoft.Net.ComponentGroup.DevelopmentPrerequisites`",
    `"Microsoft.NetCore.Component.DevelopmentTools`",
    `"Microsoft.NetCore.Component.Runtime.8.0`",
    `"Microsoft.NetCore.Component.SDK`",
    `"Microsoft.NetCore.Component.Web`",
    `"Microsoft.VisualStudio.Component.AppInsights.Tools`",
    `"Microsoft.VisualStudio.Component.AspNet`",
    `"Microsoft.VisualStudio.Component.AspNet45`",
    `"Microsoft.VisualStudio.Component.Azure.AuthoringTools`",
    `"Microsoft.VisualStudio.Component.Azure.ClientLibs`",
    `"Microsoft.VisualStudio.Component.Azure.Compute.Emulator`",
    `"Microsoft.VisualStudio.Component.Azure.Powershell`",
    `"Microsoft.VisualStudio.Component.Azure.ResourceManager.Tools`",
    `"Microsoft.VisualStudio.Component.Azure.ServiceFabric.Tools`",
    `"Microsoft.VisualStudio.Component.Azure.Waverton`",
    `"Microsoft.VisualStudio.Component.Azure.Waverton.BuildTools`",
    `"Microsoft.VisualStudio.Component.Common.Azure.Tools`",
    `"Microsoft.VisualStudio.Component.CoreEditor`",
    `"Microsoft.VisualStudio.Component.Debugger.JustInTime`",
    `"Microsoft.VisualStudio.Component.DependencyValidation.Community`",
    `"Microsoft.VisualStudio.Component.DiagnosticTools`",
    `"Microsoft.VisualStudio.Component.DockerTools`",
    `"Microsoft.VisualStudio.Component.DotNetModelBuilder`",
    `"Microsoft.VisualStudio.Component.EntityFramework`",
    `"Microsoft.VisualStudio.Component.FSharp`",
    `"Microsoft.VisualStudio.Component.FSharp.WebTemplates`",
    `"Microsoft.VisualStudio.Component.IISExpress`",
    `"Microsoft.VisualStudio.Component.IntelliCode`",
    `"Microsoft.VisualStudio.Component.JavaScript.Diagnostics`",
    `"Microsoft.VisualStudio.Component.JavaScript.TypeScript`",
    `"Microsoft.VisualStudio.Component.ManagedDesktop.Core`",
    `"Microsoft.VisualStudio.Component.ManagedDesktop.Prerequisites`",
    `"Microsoft.VisualStudio.Component.MSODBC.SQL`",
    `"Microsoft.VisualStudio.Component.MSSQL.CMDLnUtils`",
    `"Microsoft.VisualStudio.Component.NuGet`",
    `"Microsoft.VisualStudio.Component.Roslyn.Compiler`",
    `"Microsoft.VisualStudio.Component.Roslyn.LanguageServices`",
    `"Microsoft.VisualStudio.Component.SQL.CLR`",
    `"Microsoft.VisualStudio.Component.SQL.DataSources`",
    `"Microsoft.VisualStudio.Component.SQL.LocalDB.Runtime`",
    `"Microsoft.VisualStudio.Component.SQL.SSDT`",
    `"Microsoft.VisualStudio.Component.TextTemplating`",
    `"Microsoft.VisualStudio.Component.TypeScript.TSServer`",
    `"Microsoft.VisualStudio.Component.Web`",
    `"Microsoft.VisualStudio.Component.WebDeploy`",
    `"Microsoft.VisualStudio.Component.WslDebugging`",
    `"Microsoft.VisualStudio.ComponentGroup.Azure.CloudServices`",
    `"Microsoft.VisualStudio.ComponentGroup.Azure.Prerequisites`",
    `"Microsoft.VisualStudio.ComponentGroup.Azure.ResourceManager.Tools`",
    `"Microsoft.VisualStudio.ComponentGroup.AzureFunctions`",
    `"Microsoft.VisualStudio.ComponentGroup.Web`",
    `"Microsoft.VisualStudio.ComponentGroup.Web.CloudTools`",
    `"Microsoft.VisualStudio.ComponentGroup.WebToolsExtensions`",
    `"Microsoft.VisualStudio.Workload.Azure`",
    `"Microsoft.VisualStudio.Workload.CoreEditor`",
    `"Microsoft.VisualStudio.Workload.Data`",
    `"Microsoft.VisualStudio.Workload.ManagedDesktop`",
    `"Microsoft.VisualStudio.Workload.NetWeb`"
  ],
  `"extensions`": []
}") > $VSConfigFile
WingetInstall "Microsoft.VisualStudio.Professional" --version 18 --source winget --exact --override "--passive --config $($VSConfigFile)"
Read-Host -Prompt "Done." | Out-Null
