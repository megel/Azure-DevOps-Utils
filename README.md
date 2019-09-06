# Azure-DevOps-API-Utils

This is a PowerShell library to use the [Azure DevOps REST API](https://docs.microsoft.com/en-us/rest/api/azure/devops/?view=azure-devops-rest-5.1) for Azure DevOps related tasks.

## Azure DevOps Build Agent Pools

Supported Methods:

|Method|Functionality|
|-|-|
|`Get-AzureDevOpsAgentPools`|[Pools - Get Agent Pools](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/pools/get%20agent%20pools?view=azure-devops-rest-5.1)|
|`Add-AzureDevOpsAgentPool`|[Pools - Add](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/pools/add?view=azure-devops-rest-5.1)|

## Azure DevOps Deployment Pools

Supported Methods:

|Method|Functionality|
|-|-|
|`Get-AzureDevOpsDeploymentGroups`|[Deploymentgroups - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/deploymentgroups/list?view=azure-devops-rest-5.1)|
|`Add-AzureDevOpsDeploymentGroup`|[Deploymentgroups - Add:](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/deploymentgroups/add?view=azure-devops-rest-5.1)|

## Azure DevOps Build Agents

Supported Methods:

|Method|Functionality|
|-|-|
|`Get-AzureDevOpsAgents`|[Agents - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/agents/list?view=azure-devops-rest-5.1)|
|`Remove-AzureDevOpsAgent`|[Agents - Delete](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/agents/delete?view=azure-devops-rest-5.1)|

## Azure DevOps Variablegroups

Supported Methods:

|Method|Functionality|
|-|-|
|`Get-AzureDevOpsDeploymentGroups`|[Variablegroups - Get Variable Groups](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/variablegroups/get%20variable%20groups?view=azure-devops-rest-5.1)|
|`Add-AzureDevOpsVariableGroup|[Variablegroups - Add](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/variablegroups/add?view=azure-devops-rest-5.1)|
|`Update-AzureDevOpsVariableGroup`|[Variablegroups - Update](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/variablegroups/update?view=azure-devops-rest-5.1)|

## Install & Un-Install Azure DevOps Agent

|Method|Functionality|
|-|-|
|`Get-AzureDevOpsAgentInstallParameters`|Generate Command Line Parameter for `config.cmd` to **Install** the agent|
|`Get-AzureDevOpsAgentUnInstallParameters`|Generate Command Line Parameter for `config.cmd` to **Un-Install** the agent|
