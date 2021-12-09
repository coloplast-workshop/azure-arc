#requires -Version 1.0

$moduleNames = 'Az.Accounts', 'Az.ConnectedMachine', 'Az.Resources', 'Az.OperationalInsights', 'Az.Automation', 'Az.Compute', 'Az.KeyVault'
$providerNames = 'Microsoft.HybridCompute', 'Microsoft.GuestConfiguration'
$subscriptionName = ''
$resourceGroupName = 'rg-azure-arc'
$location = 'westeurope'
$servicePrincipalName = 'sp-azure-arc'
$workspaceName = 'log-analytics-' + (Get-Random -Maximum 99999)
$automationAccountName = 'automation-account'