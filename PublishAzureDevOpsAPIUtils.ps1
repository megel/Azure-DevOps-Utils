$VerbosePreference="SilentlyContinue"

# Version, Author, CompanyName and nugetkey
. (Join-Path $PSScriptRoot "settings.ps1")

Clear-Host
Push-Location

$root    = $PSScriptRoot
$sources = (Join-Path $PSScriptRoot "src")

Set-Location $sources
Invoke-ScriptAnalyzer -Path $sources -Recurse -Settings PSGallery -Severity Warning

Get-ChildItem -Path $PSScriptRoot -Recurse | ForEach-Object { Unblock-File -Path $_.FullName }

Remove-Module NavContainerHelper -ErrorAction Ignore
Uninstall-module NavContainerHelper -ErrorAction Ignore

$path = "c:\temp\AzureDevOpsAPIUtils"

if (Test-Path -Path $path) {
    Remove-Item -Path $path -Force -Recurse
}
New-Item -Path $path -ItemType Directory
Set-Location $path

Copy-Item -Path "$sources/*" -Destination "$path/" -Exclude @("settings.ps1", ".gitignore", "README.md", "PublishAzureDevOpsAPIUtils.ps1") -Recurse
Copy-Item -Path (Join-Path $root "AzureDevOpsAPIUtils.nuspec") -Destination "$path"
Remove-Item -Path (Join-Path $path ".git") -Force -Recurse -ErrorAction Ignore
Remove-Item -Path (Join-Path $path "Tests") -Force -Recurse -ErrorAction Ignore

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
Pop-Location

Remove-Item -Path $path -Force -Recurse