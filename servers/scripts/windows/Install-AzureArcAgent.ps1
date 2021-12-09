<#
    .SYNOPSIS   
    Use environment variables to install and configure the Azure ARC agent on Windows

    .NOTES
    Name        : Install-AzureArcAgent.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

$env:subscriptionId = '<Azure subscription ID>'
$env:appId = '<Azure service principal name>'
$env:password = '<Azure service principal password>'
$env:tenantId = '<Azure tenant ID>'
$env:resourceGroup = '<Azure resource group name>'
$env:location = '<Azure Region>'
$msiPackage = Join-Path -Path $env:windir -ChildPath 'Temp\AzureConnectedMachineAgent.msi'

function Get-Package()
{
  $ProgressPreference = 'SilentlyContinue'
  Invoke-WebRequest -Uri 'https://github.com/coloplast-workshop/azure-arc/raw/main/servers/packages/AzureConnectedMachineAgent.msi' -OutFile $msiPackage
}
Get-Package

& "$env:windir\system32\msiexec.exe" /i ('{0}' -f $msiPackage) /l*v "$env:windir\Temp\Install-AzureArcAgent.txt" /qn | Out-String

& "$env:ProgramFiles\AzureConnectedMachineAgent\azcmagent.exe" connect --service-principal-id $env:appId --service-principal-secret $env:password --resource-group $env:resourceGroup --tenant-id $env:tenantId --location $env:location --subscription-id $env:subscriptionId --correlation-id 'd009f5dd-dba8-4ac7-bac9-b54ef3a6671a'

Remove-Item -Path $msiPackage -ErrorAction SilentlyContinue