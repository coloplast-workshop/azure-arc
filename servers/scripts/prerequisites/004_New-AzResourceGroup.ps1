<#
    .SYNOPSIS   
    Create a new resource group

    .NOTES
    Name        : 004_New-AzResourceGroup.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

$resourceGroupName = 'rg-azure-arc'
$location = Get-AzLocation |
Where-Object -Property Providers -Contains -Value 'Microsoft.HybridCompute' |
Out-GridView -OutputMode Single

if (-not(Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue))
{
  New-AzResourceGroup -Name $resourceGroupName -Location $location.location
}