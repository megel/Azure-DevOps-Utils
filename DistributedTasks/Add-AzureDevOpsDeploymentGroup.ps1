function Add-AzureDevOpsDeploymentGroup {
    param (
        [string]$name,
        [string]$organizationUri,
        [string]$projectName,
        [string]$vstsToken,
        [string]$description = "",
        [string]$poolType = "deployment"
    )
    Process {
        $body     = @{ "name" = $name; "description" = $description; "poolType" = $poolType; } | ConvertTo-Json -Compress
        $headers  = @{ "Authorization" = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("vsts:$vstsToken")))"; "Content-Type" = "application/json"; }
        $uri      = "$organizationUri/${projectName}/_apis/distributedtask/deploymentgroups/?api-version=5.1-preview.1"
        
        Write-Host "Add deployment-group $name to '$organizationUri' (project: $($projectName))" -f Gray
        $group = ((Invoke-WebRequest -Method Post -Body $body -uri $uri -Headers $headers -UseBasicParsing).Content | ConvertFrom-Json)
        Write-Host "Deployment-group $($group.name) / pool: $($group.pool.name) to '$organizationUri' (project: $($projectName)) added." -f Gray
        return $group
    }
}
#Set-Alias -Name Add-AzureDevOpsDeploymentGroup -Value Add-DevOpsDeploymentGroup
Export-ModuleMember -Function Add-AzureDevOpsDeploymentGroup #-Alias Add-DevOpsDeploymentGroup