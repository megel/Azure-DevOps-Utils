function Get-AzureDevOpsAgentUnInstallParameters {
    param (
        [string]$vstsToken
    )
    Process {
        $parameters = @(
            "remove",
            "--auth PAT",
            "--token $vstsToken"
            )
        
        return $([string]::Join(" ", $parameters))
    }
}
Set-Alias -Name Get-AgentUnInstallParams -Value Get-AzureDevOpsAgentUnInstallParameters
Export-ModuleMember -Function Get-AzureDevOpsAgentUnInstallParameters -Alias Get-AgentUnInstallParams