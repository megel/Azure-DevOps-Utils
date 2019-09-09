function Get-AzureDevOpsVariableGroups {
    param (
        [string]$projectName,
        [string]$organizationUri,
        [string]$vstsToken        
    )
    Process {
        $headers  = @{ "Authorization" = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("vsts:$vstsToken")))"; }
        $uri      = "$organizationUri/$projectName/_apis/distributedtask/variablegroups?api-version=5.1-preview.1"
        
        Write-Host "Get variable groups from '$organizationUri' (project: $($projectName))" -f Gray
        return  ((Invoke-WebRequest -uri $uri -Headers $headers -UseBasicParsing).Content | ConvertFrom-Json).value
    }
}
#Set-Alias -Name Get-AzureDevOpsVariableGroups -Value Get-DevOpsVariableGroups
Export-ModuleMember -Function Get-AzureDevOpsVariableGroups #-Alias Get-DevOpsVariableGroups