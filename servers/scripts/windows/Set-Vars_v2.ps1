<#
    .SYNOPSIS   
    Set environment variables for onboarding the Azure ARC agent

    .NOTES
    Name        : Set-Vars.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

param (
  [Parameter(Mandatory,HelpMessage = 'Subscription ID')]
  [string]$subscriptionId,
  [Parameter(Mandatory,HelpMessage = 'Service principal name')]
  [string]$appId,
  [Parameter(Mandatory,HelpMessage = 'Service principal password')]
  [string]$env:password,
  [Parameter(Mandatory,HelpMessage = 'Tenant ID')]
  [string]$tenantId,
  [Parameter(Mandatory,HelpMessage = 'Resource group')]
  [string]$resourceGroup,
  [Parameter(Mandatory,HelpMessage = 'Resource group location')]
  [string]$location,
  [Parameter(Mandatory,HelpMessage = 'Log Analytics workspace id')]
  [string]$loganalyticsworkspaceid,
  [Parameter(Mandatory,HelpMessage = 'Log Analytics workspace key')]
  [string]$loganalyticsworkspacekey
)

[Environment]::SetEnvironmentVariable('subscriptionId', $subscriptionId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('appId', $appId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('password', $password,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('tenantId', $tenantId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('resourceGroup', $resourceGroup,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('location', $location,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('loganalyticsworkspaceid', $loganalyticsworkspaceid,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('loganalyticsworkspacekey', $loganalyticsworkspacekey,[EnvironmentVariableTarget]::Machine)