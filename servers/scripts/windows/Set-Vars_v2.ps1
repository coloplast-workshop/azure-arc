<#
    .SYNOPSIS   
    Read xml file and set environment variables for onboarding the Azure ARC agent

    .NOTES
    Name        : Set-Vars_v2.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

[string]$currentPath = Get-Location
$xmlFile = $currentPath + '\AzureCloud.xml'
[xml]$xmlContent = Get-Content -Path $xmlFile
$tenantId = $xmlContent.AzureCloud.Tenant.ID
$subscriptionId = $xmlContent.AzureCloud.Subscription.ID
$resourceGroup = $xmlContent.AzureCloud.ResourceGroup.Name
$location = $xmlContent.AzureCloud.ResourceGroup.Location
$appId = $xmlContent.AzureCloud.Tenant.ID
$password = $xmlContent.AzureCloud.ServicePrincipal.Secret
$opinsightsWorkspaceId = $xmlContent.AzureCloud.OpinsightsWorkspace.ID
$opinsightsWorkspaceKey = $xmlContent.AzureCloud.OpinsightsWorkspace.Key

[Environment]::SetEnvironmentVariable('resourceGroup', $resourceGroup,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('tenantId', $tenantId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('location', $location,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('subscriptionId', $subscriptionId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('appId', $appId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('password', $password,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('opinsightsWorkspaceId', $opinsightsWorkspaceId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('opinsightsWorkspaceKey', $opinsightsWorkspaceKey,[EnvironmentVariableTarget]::Machine)

Remove-Item -Path $xmlFile -Force -ErrorAction SilentlyContinue