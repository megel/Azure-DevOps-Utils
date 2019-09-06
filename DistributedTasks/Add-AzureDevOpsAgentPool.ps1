function Add-AzureDevOpsAgentPool {
    param (
        [string]$name,
        [string]$organizationUri,
        [string]$vstsToken,
        [bool]$autoProvision = $true,
        [bool]$autoSize = $true
    )
    Process {
        $body     = @{ "autoProvision" = $autoProvision; "autoSize" = $autoSize; "name" = $name; } | ConvertTo-Json -Compress
        $headers  = @{ "Authorization" = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("vsts:$vstsToken")))"; "Content-Type" = "application/json"; }
        $uri      = "$organizationUri/_apis/distributedtask/pools?api-version=5.1"
        
        Write-Host "Add agent-pool $($name) to '$organizationUri'" -f Yellow
        return ((Invoke-WebRequest -Method Post -Body $body -uri $uri -Headers $headers -UseBasicParsing).Content | ConvertFrom-Json)
    }
}
Set-Alias -Name Add-AzureDevOpsAgentPool -Value Add-DevOpsAgentPool
Export-ModuleMember -Function Add-AzureDevOpsAgentPool -Alias Add-DevOpsAgentPool