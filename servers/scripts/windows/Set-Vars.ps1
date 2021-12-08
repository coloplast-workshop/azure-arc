<#
    .SYNOPSIS   
    Set environment variables
    .NOTES
    Name        : Set-Vars.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

param (
  [Parameter(Mandatory,HelpMessage = 'Azure subscription ID')]
  [string]$subscriptionId,
  [Parameter(Mandatory,HelpMessage = 'Azure service principal name')]
  [string]$appId,
  [Parameter(Mandatory,HelpMessage = 'Azure service principal password')]
  [string]$env:password,
  [Parameter(Mandatory,HelpMessage = 'Azure tenant ID')]
  [string]$tenantId,
  [Parameter(Mandatory,HelpMessage = 'Azure resource group')]
  [string]$resourceGroup,
  [Parameter(Mandatory,HelpMessage = 'Azure Region')]
  [string]$location
)

[Environment]::SetEnvironmentVariable('subscriptionId', $subscriptionId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('appId', $appId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('password', $password,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('tenantId', $tenantId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('resourceGroup', $resourceGroup,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('location', $location,[EnvironmentVariableTarget]::Machine)