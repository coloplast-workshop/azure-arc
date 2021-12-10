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

. "$(Split-Path $PSCommandPath -Resolve)/globals.env.ps1"

try 
{
  Get-AzResourceGroup -Name $resourceGroupName -ErrorAction Stop
} 
catch 
{
  New-AzResourceGroup -Name $resourceGroupName -Location $location
}
New-AzOperationalInsightsWorkspace -ResourceGroupName $resourceGroupName -Name $workspaceName -Location $location -Sku 'pergb2018'