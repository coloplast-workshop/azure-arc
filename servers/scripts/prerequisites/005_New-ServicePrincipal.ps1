<#
    .SYNOPSIS   
    Create a new service principal for Azure ARC

    .NOTES
    Name        : 005_New-ServicePrincipal.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

. "$(Split-Path $PSCommandPath -Resolve)/globals.env.ps1"

if (-not (Get-AzADServicePrincipal -DisplayName $servicePrincipalName))
{
  $servicePrincipal = New-AzADServicePrincipal -DisplayName $servicePrincipalName -Role 'Azure Connected Machine Onboarding'
  $BSTR = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($servicePrincipal.Secret)
  $unsecureSecret = [Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
  return $unsecureSecret
}