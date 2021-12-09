<#
    .SYNOPSIS   
    Enable Update Management
    https://docs.microsoft.com/en-us/azure/automation/update-management/enable-from-template#deploy-template

    .NOTES
    Name        : 008_Enable-UpdateManagement.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

. "$(Split-Path $PSCommandPath -Resolve)/globals.env.ps1"

New-AzResourceGroupDeployment `
-Name 'DeployAALAUM' `
-ResourceGroupName $resourceGroupName `
-TemplateFile 'https://raw.githubusercontent.com/coloplast-workshop/azure-arc/main/servers/scripts/prerequisites/arm/deployUMSolutiontemplate.json' `
-_artifactsLocation 'https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.automation/101-automation/azuredeploy.json'