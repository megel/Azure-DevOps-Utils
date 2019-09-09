function Get-AzureDevOpsAgents {
    param (
        [string]$poolId,
        [string]$organizationUri,
        [string]$vstsToken        
    )
    Process {
        $headers  = @{ "Authorization" = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("vsts:$vstsToken")))"; }
        $uri      = "$organizationUri/_apis/distributedtask/pools/$($poolId)/agents?api-version=5.1"
        
        Write-Host "Get agents from '$organizationUri' (agent-pool id: $($poolId))" -f Gray
        return  ((Invoke-WebRequest -uri $uri -Headers $headers -UseBasicParsing).Content | ConvertFrom-Json).value
    }
}
#Set-Alias -Name Get-AzureDevOpsAgents -Value Get-DevOpsAgents
Export-ModuleMember -Function Get-AzureDevOpsAgents #-Alias Get-DevOpsAgents