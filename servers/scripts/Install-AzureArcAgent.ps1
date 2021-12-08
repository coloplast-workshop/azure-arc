#requires -Version 3.0 -Modules ScheduledTasks

<#
    .SYNOPSIS   
    Setup environment, create a ps script and add a scheduled task that run the ps script at startup

    .NOTES
    Name        : Install-AzureArcAgent.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

param (
  [Parameter(Mandatory,HelpMessage = 'Subscription ID')]
  [string]$subscriptionId,
  [Parameter(Mandatory,HelpMessage = 'App ID')]
  [string]$appId,
  [Parameter(Mandatory,HelpMessage = 'Password')]
  [string]$password,
  [Parameter(Mandatory,HelpMessage = 'Tenant ID')]
  [string]$tenantId,
  [Parameter(Mandatory,HelpMessage = 'Resource group')]
  [string]$resourceGroup,
  [Parameter(Mandatory,HelpMessage = 'Location')]
  [string]$location
)

[Environment]::SetEnvironmentVariable('subscriptionId', $subscriptionId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('appId', $appId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('password', $password,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('tenantId', $tenantId,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('resourceGroup', $resourceGroup,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('location', $location,[EnvironmentVariableTarget]::Machine)

$startupScript = Join-Path -Path $env:windir -ChildPath 'Temp\StartupScript.ps1'
$description = @'
Install the Azure ARC agent
'@
$taskName = 'InstallAzureArcAgent'
$action = @{
  Execute  = 'powershell.exe'
  Argument = ('-NoProfile -ExecutionPolicy Bypass -File "{0}"' -f $startupScript)
}
$principal = @{
  UserId    = 'NT AUTHORITY\SYSTEM'
  LogonType = 'ServiceAccount'
  RunLevel  = 'Highest'
}
$settings = @{
  AllowStartIfOnBatteries    = $true
  Compatibility              = 'Win8'
  DontStopIfGoingOnBatteries = $true
  DontStopOnIdleEnd          = $true
  ExecutionTimeLimit         = (New-TimeSpan -Minutes 60)
  MultipleInstances          = 'IgnoreNew'
  RunOnlyIfNetworkAvailable  = $true
  Priority                   = 0
  StartWhenAvailable         = $true
}
$scheduledTask = @{
  Trigger     = New-ScheduledTaskTrigger -AtStartup
  Action      = New-ScheduledTaskAction @action
  Principal   = New-ScheduledTaskPrincipal @principal
  Settings    = New-ScheduledTaskSettingsSet @settings
  Description = $description
}

Set-Content -Value 'Start-Transcript -Path $env:windir\Temp\StartupScript.log' -Path $startupScript
Add-Content -Value 'Write-Host -Object "Configure the OS to allow Azure Arc Agent to be deploy on an Azure VM"' -Path $startupScript
Add-Content -Value 'Set-Service -Name WindowsAzureGuestAgent -StartupType Disabled -Verbose' -Path $startupScript
Add-Content -Value 'Stop-Service -Name WindowsAzureGuestAgent -Force -Verbose' -Path $startupScript
Add-Content -Value 'New-NetFirewallRule -Name BlockAzureIMDS -DisplayName "Block access to Azure IMDS" -Enabled True -Profile Any -Direction Outbound -Action Block -RemoteAddress 169.254.169.254' -Path $startupScript
Add-Content -Value 'Write-Host -Object "Onboarding to Azure Arc"' -Path $startupScript
Add-Content -Value 'function Get-MsiPackage()' -Path $startupScript
Add-Content -Value '{' -Path $startupScript
Add-Content -Value '  $ProgressPreference = "SilentlyContinue"' -Path $startupScript
Add-Content -Value '  Invoke-WebRequest -Uri https://aka.ms/AzureConnectedMachineAgent -OutFile AzureConnectedMachineAgent.msi' -Path $startupScript
Add-Content -Value '}' -Path $startupScript

Add-Content -Value 'Get-MsiPackage' -Path $startupScript
Add-Content -Value '& "$env:windir\system32\msiexec.exe" /i AzureConnectedMachineAgent.msi /l*v installationlog.txt /qn | Out-String' -Path $startupScript
Add-Content -Value '& "$env:ProgramFiles\AzureConnectedMachineAgent\azcmagent.exe" connect --service-principal-id $env:appId --service-principal-secret $env:password --resource-group $env:resourceGroup --tenant-id $env:tenantId --location $env:location --subscription-id $env:subscriptionId --tags "Azure_ARC_servers" --correlation-id "d009f5dd-dba8-4ac7-bac9-b54ef3a6671a"' -Path $startupScript
Add-Content -Value 'Unregister-ScheduledTask -TaskName "StartupScript" -Confirm:$false' -Path $startupScript
Add-Content -Value 'Stop-Process -Name "powershell" -Force' -Path $startupScript

New-ScheduledTask @scheduledTask | Register-ScheduledTask -TaskName $taskName -Force