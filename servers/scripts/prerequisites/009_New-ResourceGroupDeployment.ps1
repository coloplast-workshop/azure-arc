<#
    .SYNOPSIS   
    Create a new resource group deployment

    .NOTES
    Name        : 009_New-ResourceGroupDeployment.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

$resourceGroup = 'rg-azure-arc'

New-AzResourceGroupDeployment -Name VM-UpdateManagement -ResourceGroupName $ResourceGroup -Mode Incremental -TemplateFile ./azuredeploy.json -TemplateParameterFile ./azuredeploy-parm.json -Verbose