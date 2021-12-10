#requires -Version 3.0 -Modules Az.Resources

<#
    .SYNOPSIS   
    Create a new resource group deployment

    .NOTES
    Name        : 009_New-ResourceGroupDeployment.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

. "$(Split-Path $PSCommandPath -Resolve)/globals.env.ps1"

New-AzResourceGroupDeployment -Name $resourceGroupDeploymentName -ResourceGroupName $resourceGroupName -Mode Incremental -TemplateFile ./azuredeploy.json -TemplateParameterFile ./azuredeploy-parm.json