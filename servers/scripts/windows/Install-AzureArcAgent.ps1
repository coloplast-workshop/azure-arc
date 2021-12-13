<#
    .SYNOPSIS   
    Use environment variables to install and configure the Azure ARC agent

    .NOTES
    Name        : Install-AzureArcAgent.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

function Get-Package()
{
  $ProgressPreference = 'SilentlyContinue'
  Invoke-WebRequest -Uri 'https://github.com/coloplast-workshop/azure-arc/raw/main/servers/packages/AzureConnectedMachineAgent.msi' -OutFile $msiPackage
}

$msiPackage = Join-Path -Path $env:windir -ChildPath 'Temp\AzureConnectedMachineAgent.msi'

Get-Package
& "$env:windir\system32\msiexec.exe" /i ('{0}' -f $msiPackage) /l*v "$env:windir\Temp\Install-AzureArcAgent.txt" /qn | Out-String
& "$env:ProgramFiles\AzureConnectedMachineAgent\azcmagent.exe" connect --tenant-id $env:tenantId --subscription-id $env:subscriptionId --resource-group $env:resourceGroup --location $env:location --service-principal-id $env:appId --service-principal-secret $env:password --verbose
Remove-Item -Path $msiPackage -Force -ErrorAction SilentlyContinue