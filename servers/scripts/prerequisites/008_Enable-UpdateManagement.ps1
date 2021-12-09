New-AzResourceGroupDeployment `
    -Name DeployAALAUM `
    -ResourceGroupName 'rg-azure-arc' `
    -TemplateFile deployUMSolutiontemplate.json `
    -_artifactsLocation "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.automation/101-automation/azuredeploy.json"