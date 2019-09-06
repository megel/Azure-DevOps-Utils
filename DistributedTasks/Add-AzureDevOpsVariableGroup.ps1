function Add-AzureDevOpsVariableGroup {
    param (
        [string]$name,
        [string]$projectName,
        [string]$organizationUri,
        [string]$description  = $null,
        [hashtable]$variables = $null,
        [hashtable]$secrets = $null,
        [string]$vstsToken        
    )
    Process {
        $group    = @{ "name" = $name; "type" = "Vsts" }
        if ("$description" -ne "") {
            $group["description"] = $description;
        }
        if ($null -ne $variables -or $null -ne $secrets) {
            $group["variables"] = [hashtable]@{}
        }
        if ($null -ne $variables) {
            $variables.Keys | ForEach-Object {
                $value = $variables[$_]
                $group["variables"]["$_"] = @{ "value" = $value; }
            }
        }
        if ($null -ne $secrets) {
            $secrets.Keys | ForEach-Object {
                $value = $secrets[$_]
                $group["variables"]["$_"] = @{ "value" = $value; "isSecret" = $true; }
            }
        }

        $body     = $group | ConvertTo-Json -Compress
        $headers  = @{ "Authorization" = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("vsts:$vstsToken")))"; "Content-Type" = "application/json"; }
        $uri      = "$organizationUri/$projectName/_apis/distributedtask/variablegroups?api-version=5.1-preview.1"

        Write-Host "Create variable group $name for '$organizationUri' (project: $($projectName))" -f Gray
        $group = ((Invoke-WebRequest -Method Post -Body $body -uri $uri -Headers $headers -UseBasicParsing).Content | ConvertFrom-Json)
        Write-Host "Variable group $($group.name) for '$organizationUri' (project: $($projectName)) created" -f Gray
        return $group
    }
}
Set-Alias -Name Add-AzureDevOpsVariableGroup -Value Add-DevOpsVariableGroup
Export-ModuleMember -Function Add-AzureDevOpsVariableGroup -Alias Add-DevOpsVariableGroups