function Get-AzureDevOpsDeploymentGroups {
    param (
        [string]$organizationUri,
        [string]$projectName,
        [string]$vstsToken        
    )
    Process {
        $headers  = @{ "Authorization" = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("vsts:$vstsToken")))"; }
        $uri      = "$organizationUri/${projectName}/_apis/distributedtask/deploymentgroups/?api-version=5.1-preview.1"
        
        Write-Host "Get deployment-pools from '$organizationUri' (project: $($projectName))" -f Gray
        return  ((Invoke-WebRequest -uri $uri -Headers $headers -UseBasicParsing).Content | ConvertFrom-Json).value
    }
}
#Set-Alias -Name Get-AzureDevOpsGetDeploymentGroups -Value Get-DevOpsDeploymentGroups
Export-ModuleMember -Function Get-AzureDevOpsDeploymentGroups #-Alias Get-DevOpsDeploymentGroups