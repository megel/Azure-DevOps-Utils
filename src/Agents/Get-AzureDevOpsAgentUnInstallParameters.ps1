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
Export-ModuleMember -Function Get-AzureDevOpsAgentUnInstallParameters