#requires -RunAsAdministrator

<#
    .SYNOPSIS   
    Install Az modules

    .NOTES
    Name        : 001_Install-AzModules.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

$moduleNames = 'Az.Accounts', 'Az.ConnectedMachine', 'Az.Resources', 'Az.OperationalInsights', 'Az.Automation', 'Az.Compute', 'Az.KeyVault'

Install-PackageProvider -Name 'NuGet' -MinimumVersion 2.8.5.201 -Force

foreach ($moduleName in $moduleNames)
{
  if (-not (Get-InstalledModule -Name $moduleName -ErrorAction Ignore))
  {
    Install-Module -Name $moduleName -Force
  }
  else
  {
    Update-Module -Name $moduleName -Force
  }
}