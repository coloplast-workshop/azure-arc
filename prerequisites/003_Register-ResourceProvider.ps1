<#
    .SYNOPSIS   
    Register resource providers

    .NOTES
    Name        : 003_Register-ResourceProvider.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

. "$(Split-Path $PSCommandPath -Resolve)/globals.env.ps1"

foreach ($providerName in $providerNames)
{
  Register-AzResourceProvider -ProviderNamespace $providerName
}