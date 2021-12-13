<#
    .SYNOPSIS   
    Use environment variables to install and configure the Azure ARC agent on Windows

    .NOTES
    Name        : Install-AzureArcAgent_v2.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

function Get-Package()
{
  $ProgressPreference = 'SilentlyContinue'
  Invoke-WebRequest -Uri ('{0}/{1}' -f $url, $package) -OutFile ('{0}/{1}' -f $localFolder, $package)
}

$localFolder = $env:SystemDrive + '\packages'
$url = 'https://github.com/coloplast-workshop/azure-arc/raw/main/servers/packages'
$packages = 'microsoft.azurearcagent.1.12.0.nupkg', 'microsoft.azureloganalyticsagent.11.0.9600.nupkg', 'microsoft.dependencyagent.9.10.11.nupkg'

if (-not (Test-Path -Path $localFolder))
{
  $null = New-Item -Path $localFolder -ItemType 'Directory' -Force
}
foreach ($package in $packages)
{
  Get-Package $url $package
}

& "$env:ChocolateyInstall\bin\choco.exe" install 'microsoft.azurearcagent' -s "$env:SystemDrive\packages" -y
& "$env:ProgramW6432\AzureConnectedMachineAgent\azcmagent.exe" connect --service-principal-id $env:appId --service-principal-secret $env:password --resource-group $env:resourceGroup --tenant-id $env:tenantId --location $env:location --subscription-id $env:subscriptionId  --verbose