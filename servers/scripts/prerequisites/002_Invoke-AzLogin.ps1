<#
    .SYNOPSIS   
    Login to Azure

    .NOTES
    Name        : 002_Invoke-AzLogin.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

Connect-AzAccount -UseDeviceAuthentication

$context = Get-AzContext -ListAvailable
if (($context).count -gt 1)
{
  $context |
  Out-GridView -OutputMode Single |
  Set-AzContext
}

$subscriptions = Get-AzSubscription
if (($subscriptions).count -gt 1)
{
  $subscriptions |
  Out-GridView -OutputMode Single |
  Set-AzContext
}
