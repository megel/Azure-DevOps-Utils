function Update-AzureDevOpsVariableGroup {
    param (
        [string]$groupId,
        [string]$name,
        [string]$projectName,
        [string]$organizationUri,
        [string]$vstsToken,
        [string]$description  = $null,
        [Hashtable]$variables = $null,
        [Hashtable]$secrets = $null                
    )
    Process {
        $group    = @{ "name" = $name; }
        if ("$description" -ne "") {
            $group["description"] = $description;
        }
        if ($null -ne $variables -or $null -ne $secrets) {
            $group["variables"] = [hashtable]@{}
        }
        if ($null -ne $variables) {
            $variables.Keys | ForEach-Object {
                $value = $variables[$_]
                $group["variables"]["$_"] = @{ "value" = "$value"; }
            }
        }
        if ($null -ne $secrets) {
            $secrets.Keys | ForEach-Object {
                $value = $secrets[$_]
                $group["variables"]["$_"] = @{ "value" = "$value"; "isSecret" = $true; }
            }
        }

        $body     = $group | ConvertTo-Json -Compress
        $headers  = @{ "Authorization" = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("vsts:$vstsToken")))"; "Content-Type" = "application/json"; }
        $uri      = "$organizationUri/$projectName/_apis/distributedtask/variablegroups/$($groupId)?api-version=5.1-preview.1"
        
        Write-Host "Update variable groups $name for '$organizationUri' (project: $($projectName))" -f Gray
        
        $group = ((Invoke-WebRequest -Method Put -Body $body -uri $uri -Headers $headers -UseBasicParsing).Content | ConvertFrom-Json)
        Write-Host "Variable group $($group.name) for '$organizationUri' (project: $($projectName)) updated" -f Gray
        return $group
    }
}
Set-Alias -Name Update-AzureDevOpsVariableGroup -Value Update-DevOpsVariableGroup
Export-ModuleMember -Function Update-AzureDevOpsVariableGroup -Alias Update-DevOpsVariableGroup