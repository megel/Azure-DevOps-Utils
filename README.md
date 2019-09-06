# Azure-DevOps-API-Utils

This is a PowerShell library to use the [Azure DevOps REST API](https://docs.microsoft.com/en-us/rest/api/azure/devops/?view=azure-devops-rest-5.1) for Azure DevOps related tasks.

## Azure DevOps Build Agent Pools

Supported Methods:

* [Pools - Get Agent Pools](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/pools/get%20agent%20pools?view=azure-devops-rest-5.1)
* [Pools - Add](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/pools/add?view=azure-devops-rest-5.1)

## Azure DevOps Deployment Pools

Supported Methods:

* [Deploymentgroups - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/deploymentgroups/list?view=azure-devops-rest-5.1)
* [Deploymentgroups - Add](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/deploymentgroups/add?view=azure-devops-rest-5.1)

## Azure DevOps Build Agents

Supported Methods:

* [Agents - Delete](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/agents/delete?view=azure-devops-rest-5.1)
* [Agents - List](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/agents/list?view=azure-devops-rest-5.1)

## Azure DevOps Variablegroups

Supported Methods:

* [Variablegroups - Get Variable Groups](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/variablegroups/get%20variable%20groups?view=azure-devops-rest-5.1)
* [Variablegroups - Add](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/variablegroups/add?view=azure-devops-rest-5.1)
* [Variablegroups - Update](https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/variablegroups/update?view=azure-devops-rest-5.1)

'Add-AzureDevOpsAgentPool', 
'Add-AzureDevOpsDeploymentGroup', 
'Get-AzureDevOpsAgentInstallParameters', 
'Get-AzureDevOpsAgentPools', 
'Get-AzureDevOpsAgents', 
'Get-AzureDevOpsAgentUnInstallParameters', 
'Get-AzureDevOpsDeploymentGroups',
'Remove-AzureDevOpsAgent'