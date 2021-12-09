<#
    .SYNOPSIS   
    Create a Log Analytics workspace
    Workspace names need to be unique in resource group

    .NOTES
    Name        : 006_New-LogAnalyticsWorkspace.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

$resourceGroup = 'rg-azure-arc'
$workspaceName = 'log-analytics-' + (Get-Random -Maximum 99999)
$location = 'westeurope'

try 
{
  Get-AzResourceGroup -Name $resourceGroup -ErrorAction Stop
} 
catch 
{
  New-AzResourceGroup -Name $resourceGroup -Location $location
}
New-AzOperationalInsightsWorkspace -ResourceGroupName $resourceGroup -Name $workspaceName -Location $location -Sku pergb2018