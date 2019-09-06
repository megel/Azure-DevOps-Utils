$VerbosePreference="SilentlyContinue"

# Version, Author, CompanyName and nugetkey
. (Join-Path $PSScriptRoot "settings.ps1")

Clear-Host
#Invoke-ScriptAnalyzer -Path $PSScriptRoot -Recurse -Settings PSGallery -Severity Warning

Get-ChildItem -Path $PSScriptRoot -Recurse | ForEach-Object { Unblock-File -Path $_.FullName }

Remove-Module AzureDevOpsAPIUtils -ErrorAction Ignore
Uninstall-module AzureDevOpsAPIUtils -ErrorAction Ignore

$path = "c:\temp\AzureDevOpsAPIUtils"

if (Test-Path -Path $path) {
    Remove-Item -Path $path -Force -Recurse
}
Copy-Item -Path $PSScriptRoot -Destination "c:\temp" -Exclude @("settings.ps1", ".gitignore", "README.md", "PublishAzureDevOpsAPIUtils.ps1") -Recurse
Remove-Item -Path (Join-Path $path ".git") -Force -Recurse
Remove-Item -Path (Join-Path $path "Tests") -Force -Recurse

$modulePath = Join-Path $path "AzureDevOpsAPIUtils.psm1"
Import-Module $modulePath -DisableNameChecking

$functionsToExport = (get-module -Name AzureDevOpsAPIUtils).ExportedFunctions.Keys | Sort-Object
$aliasesToExport = (get-module -Name AzureDevOpsAPIUtils).ExportedAliases.Keys | Sort-Object

Update-ModuleManifest -Path (Join-Path $path "AzureDevOpsAPIUtils.psd1") `
                      -RootModule "AzureDevOpsAPIUtils.psm1" `
                      -ModuleVersion $version `
                      -Author $author `
                      -FunctionsToExport $functionsToExport `
                      -AliasesToExport $aliasesToExport `
                      -CompanyName $CompanyName `
                      -ReleaseNotes (get-content (Join-Path $path "ReleaseNotes.txt")) 

Copy-Item -Path (Join-Path $path "AzureDevOpsAPIUtils.psd1") -Destination $PSScriptRoot -Force
Publish-Module -Path $path -NuGetApiKey $nugetkey

Remove-Item -Path $path -Force -Recurse