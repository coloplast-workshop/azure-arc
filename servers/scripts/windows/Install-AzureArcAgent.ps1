<#
    .SYNOPSIS   
    Use environment variables to install and configure the Azure ARC agent on Windows

    .NOTES
    Name        : Install-AzureArcAgent.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

$env:subscriptionId = '<Your Azure subscription ID>'
$env:appId = '<Your Azure service principal name>'
$env:password = '<Your Azure service principal password>'
$env:tenantId = '<Your Azure tenant ID>'
$env:resourceGroup = '<Azure resource group name>'
$env:location = '<Azure Region>'

function Get-MsiPackage()
{
  $ProgressPreference = 'SilentlyContinue'
  Invoke-WebRequest -Uri 'https://github.com/coloplast-workshop/azure-arc/raw/main/servers/packages/AzureConnectedMachineAgent.msi' -OutFile "$env:windir\Temp\AzureConnectedMachineAgent.msi"
}

# Download Azure ARC agent MSI package
Get-MsiPackage

# Install Azure ARC agent
& "$env:windir\system32\msiexec.exe" /i "$env:windir\Temp\AzureConnectedMachineAgent.msi" /l*v "$env:windir\Temp\AzureConnectedMachineAgent.txt" /qn | Out-String

# Configure Azure ARC agent
& "$env:ProgramFiles\AzureConnectedMachineAgent\azcmagent.exe" connect --service-principal-id $env:appId --service-principal-secret $env:password --resource-group $env:resourceGroup --tenant-id $env:tenantId --location $env:location --subscription-id $env:subscriptionId --tags 'Azure_ARC_servers' --correlation-id 'd009f5dd-dba8-4ac7-bac9-b54ef3a6671a'