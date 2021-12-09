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
