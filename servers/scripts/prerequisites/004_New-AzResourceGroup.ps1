$resourceGroupName = 'rg-azure-arc'
$location = Get-AzLocation |
Where-Object -Property Providers -Contains -Value 'Microsoft.HybridCompute' |
Out-GridView -OutputMode Single

if (-not(Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue))
{
  New-AzResourceGroup -Name $resourceGroupName -Location $location.location
}