<#
    .SYNOPSIS   
    Create a new Automation account

    .NOTES
    Name        : 007_New-AutomationAccount.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

$resourceGroup = 'rg-azure-arc'
$location = 'westeurope'

New-AzAutomationAccount -ResourceGroupName $resourceGroup -Location $location -Name 'automation-account'