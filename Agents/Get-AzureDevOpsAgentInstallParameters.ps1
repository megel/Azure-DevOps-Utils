<#
.SYNOPSIS
Generate a set of parameter for CI Agent or Deployment Agent
.DESCRIPTION
Generate a set of parameter see also: https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-windows?view=azure-devops
.PARAMETER poolName
Name of the Pool
.PARAMETER deploymentGroup
Name of the Deployment Group
.PARAMETER projectName
Name of the Azure DevOps Project
.PARAMETER deploymentGroupTags
Optional Tags for the Agent, if it is used as a deployment group agent
.PARAMETER agentName
Name of the agent
.PARAMETER organizationUri
Uri of your Azure DevOps organization.
.PARAMETER vstsToken
VSTS-Token to use PAT authentication.
.PARAMETER runasservice
Add the agent as service.
.PARAMETER credential
Optional Credentials for Service Registration
.EXAMPLE
Install Agent at a Deployment Pool:
Get-AzureDevOpsAgentInstallParameters -deploymentGroup $poolName -projectName $projectName -organizationUri $devOpsURL -vstsToken $vstsToken -agentName $containerName -credential $credential -runasservice

Install Agent at an Agent Pool:
Get-AzureDevOpsAgentInstallParameters -poolName $pool.name -organizationUri $devOpsURL -vstsToken $vstsToken -agentName $containerName -credential $credential -runasservice
.NOTES
General notes
#>

function Get-AzureDevOpsAgentInstallParameters {
    param (
        # -- Agent Pool -------
        [string]$poolName         = "",
        # -- Deployment Pool --
        [string]$deploymentGroup  = "",
        [string]$projectName      = "",
        [string[]]$deploymentGroupTags = $null,
        # ---------------------
        [string]$agentName        = "",
        [string]$organizationUri,
        [string]$vstsToken,
        [switch]$runasservice,
        [PSCredential]$credential = $null
    )
    Process {
        $parameters = @(
            "--unattended",
            "--agent ""$agentName""",
            "--url ""$organizationUri""",
            "--auth PAT",
            "--token $vstsToken",
            "--acceptTeeEula",
            "--noRestart",
            "--replace"
            )
        if ($runasservice) {
            $parameters += @("--runasservice")
        }
        if ("$poolName" -ne "") {
            $parameters += @("--pool ""$poolName""")
        } elseif ("$deploymentGroup" -ne "" -and "$projectName" -ne "") {
            $parameters += @(
                "--deploymentgroup", 
                "--deploymentgroupname ""$deploymentGroup""", 
                "--work ""_work""",
                "--projectname ""$projectName"""
            )
            if ($null -ne $deploymentGroupTags -and $deploymentGroupTags.Count -gt 0) {
                $parameters += @(
                    "--addDeploymentGroupTags",
                    "--deploymentGroupTags ""$([string]::Join(",", $deploymentGroupTags))"""
                )
            }
        } else {
            Write-Warning "Incomplete parameters for Pool (poolName) or Deployment Group (deploymentGroup and projectName)"
        }

        if ($null -ne $credential) {
            $parameters += @(
                "--windowsLogonAccount .\$($credential.UserName)",
                "--windowsLogonPassword $($Credential.GetNetworkCredential().Password)"
            )        
        }
        
        return $([string]::Join(" ", $parameters))
    }
}
Set-Alias -Name Get-AgentInstallParams -Value Get-AzureDevOpsAgentInstallParameters
Export-ModuleMember -Function Get-AzureDevOpsAgentInstallParameters -Alias Get-AgentInstallParams