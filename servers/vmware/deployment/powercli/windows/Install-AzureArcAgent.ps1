$msiPackage = Join-Path -Path $env:windir -ChildPath 'Temp\AzureConnectedMachineAgent.msi'
$logFile = Join-Path -Path $env:windir -ChildPath 'Temp\Install-AzureArcAgent.txt'

Invoke-Expression -Command "$env:SystemDrive\AzureARC\vars.ps1"

function Get-Package()
{
  $ProgressPreference = 'SilentlyContinue'
  Invoke-WebRequest -Uri 'https://github.com/coloplast-workshop/azure-arc/raw/main/servers/packages/AzureConnectedMachineAgent.msi' -OutFile $msiPackage
}
Get-Package

$exitCode = (Start-Process -FilePath 'msiexec.exe' -ArgumentList @('/i', ('{0}' -f $msiPackage), '/l*v', ('{0}' -f $logFile), '/qn') -Wait -PassThru).ExitCode
if ($exitCode -ne 0) 
{
  $message = (& "$env:windir\system32\net.exe" helpmsg $exitCode)
  throw ('Installation failed: {0} See {1} for additional details.' -f $message, $logFile)
}

& "$env:ProgramW6432\AzureConnectedMachineAgent\azcmagent.exe" connect `
--service-principal-id $env:servicePrincipalClientId `
--service-principal-secret $env:servicePrincipalSecret `
--resource-group $env:resourceGroup `
--tenant-id $env:tenant_id `
--location $env:location `
--subscription-id $env:subscription_id `
--cloud 'AzureCloud' `
--tags 'Azure_ARC_servers' `
--correlation-id 'd009f5dd-dba8-4ac7-bac9-b54ef3a6671a'

Remove-Item -Path $msiPackage -Force -ErrorAction SilentlyContinue