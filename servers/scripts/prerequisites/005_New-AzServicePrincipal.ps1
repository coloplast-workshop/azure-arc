$servicePrincipalName = 'sp-azure-arc'

if (-not (Get-AzADServicePrincipal -DisplayName $servicePrincipalName))
{
  $servicePrincipal = New-AzADServicePrincipal -DisplayName 'Arc-for-servers' -Role 'Azure Connected Machine Onboarding'
  $BSTR = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($servicePrincipal.Secret)
  $unsecureSecret = [Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
  $unsecureSecret
}