<#
    .SYNOPSIS   
    Create a new Automation account

    .NOTES
    Name        : 007_New-AutomationAccount.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

. "$(Split-Path $PSCommandPath -Resolve)/globals.env.ps1"

New-AzAutomationAccount -ResourceGroupName $resourceGroupName -Location $location -Name $automationAccountName