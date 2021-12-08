. "$(Split-Path $PSCommandPath -Resolve)/00_az_commons.ps1"

$servicePrincipal = New-AzADServicePrincipal -DisplayName $servicePrincipalName -Role 'Azure Connected Machine Onboarding'
$servicePrincipalCredentials = New-Object -TypeName 'pscredential' -ArgumentList 'temp', $servicePrincipal.Secret
$servicePrincipalDetails = @{
  'subscriptionId' = $subscription.SubscriptionId
  'tenantId'     = $subscription.TenantId
  'appId'        = $servicePrincipal.ApplicationId
  'appSec'       = $servicePrincipalCredentials.GetNetworkCredential().password
}

Write-Output -InputObject $servicePrincipalDetails