# Distributed Tasks functions
. (Join-Path $PSScriptRoot "DistributedTasks/Add-AzureDevOpsAgentPool.ps1")
. (Join-Path $PSScriptRoot "DistributedTasks/Add-AzureDevOpsDeploymentGroup.ps1")
. (Join-Path $PSScriptRoot "DistributedTasks/Get-AzureDevOpsAgentPools.ps1")
. (Join-Path $PSScriptRoot "DistributedTasks/Get-AzureDevOpsAgents.ps1")
. (Join-Path $PSScriptRoot "DistributedTasks/Get-AzureDevOpsDeploymentGroups.ps1")
. (Join-Path $PSScriptRoot "DistributedTasks/Remove-AzureDevOpsAgent.ps1")

# Agents functions
. (Join-Path $PSScriptRoot "Agents/Get-AzureDevOpsAgentInstallParameters.ps1")
. (Join-Path $PSScriptRoot "Agents/Get-AzureDevOpsAgentUnInstallParameters.ps1")