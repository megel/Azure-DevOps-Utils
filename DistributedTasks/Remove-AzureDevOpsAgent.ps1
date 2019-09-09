function Remove-AzureDevOpsAgent {
    param (
        [string]$name,
        [string]$poolId,
        [string]$organizationUri,
        [string]$vstsToken
    )
    Process {
        $agents    = Get-AzureDevOpsAgents -poolId $poolId -organizationUri $organizationUri -vstsToken $vstsToken
        $agent     = ($agents | Where-Object { $_.name -eq "$name" } | Select-Object -First 1)
        if ($agent) {
            $headers  = @{ "Authorization" = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("vsts:$vstsToken")))"; }
            $uri      = "$organizationUri/_apis/distributedtask/pools/$($poolId)/agents/$($agent.id)?api-version=5.1"
            Write-Host "Remove $($agent.name) from pool $($pool.name)" -f Yellow
            if ((Invoke-WebRequest -Method Delete -uri $uri -Headers $headers -UseBasicParsing).StatusCode -eq 204) {
                Write-Host "Agent $name removed." -f Green
            } else {
                Write-Warning "Agent $name not removed."
            }
        }
    }
}
#Set-Alias -Name Remove-AzureDevOpsAgent -Value Remove-DevOpsAgent
Export-ModuleMember -Function Remove-AzureDevOpsAgent #-Alias Remove-DevOpsAgent