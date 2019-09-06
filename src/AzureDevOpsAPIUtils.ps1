Get-ChildItem -Path $PSScriptRoot -Recurse | ForEach-Object { Unblock-File -Path $_.FullName }

Remove-Module AzureDevOpsAPIUtils -ErrorAction Ignore
Uninstall-module AzureDevOpsAPIUtils -ErrorAction Ignore

$modulePath = Join-Path $PSScriptRoot "AzureDevOpsAPIUtils.psm1"
Import-Module $modulePath