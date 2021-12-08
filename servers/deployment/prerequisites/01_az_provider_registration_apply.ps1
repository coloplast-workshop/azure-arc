. "$(Split-Path -Path $PSCommandPath -Resolve)/00_az_commons.ps1"

$providerStatus = Get-AzResourceProvider -ProviderNamespace microsoft.HybridCompute -Location $location
$providerStatus | Select-Object -Property ProviderNamespace, RegistrationState, Locations
$providerStatus = Get-AzResourceProvider -ProviderNamespace microsoft.GuestConfiguration -Location $location
$providerStatus | Select-Object -Property ProviderNamespace, RegistrationState, Locations

Register-AzResourceProvider -ProviderNamespace microsoft.HybridCompute
Register-AzResourceProvider -ProviderNamespace microsoft.GuestConfiguration