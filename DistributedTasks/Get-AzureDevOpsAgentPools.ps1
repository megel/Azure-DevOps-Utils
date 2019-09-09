function Get-AzureDevOpsAgentPools {
    param (
        [string]$organizationUri,
        [string]$vstsToken        
    )
    Process {
        $headers  = @{ "Authorization" = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("vsts:$vstsToken")))"; }
        $uri      = "$organizationUri/_apis/distributedtask/pools?api-version=5.1"

        Write-Host "Get agent-pools from '$organizationUri'" -f Gray
        return ((Invoke-WebRequest -uri $uri -Headers $headers -UseBasicParsing).Content | ConvertFrom-Json).value
    }
}
#Set-Alias -Name Get-AzureDevOpsAgentPools -Value Get-DevOpsAgentPools
Export-ModuleMember -Function Get-AzureDevOpsAgentPools #-Alias Get-DevOpsAgentPools