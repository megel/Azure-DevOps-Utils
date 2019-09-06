function Get-AzureDevOpsAgentInstallParameters {
    param (
        # -- Agent Pool -------
        [string]$poolName         = "",
        # -- Deployment Pool --
        [string]$deploymentGroup  = "",
        [string]$projectName      = "",
        # ---------------------
        [string]$agentName        = "",
        [string]$organizationUri,
        [string]$vstsToken,
        [switch]$runasservice,
        [PSCredential]$credential = $null
    )
    Process {
        $parameters = @(
            #"--unattended",
            "--agent ""$agentName""",
            "--url ""$organizationUri""",
            "--auth PAT",
            "--token $vstsToken",
            "--acceptTeeEula",
            "--noRestart"
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
                "--projectname ""$projectName""",
                "--replace"
            )
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