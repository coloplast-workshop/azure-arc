# Injecting environment variables
Invoke-Expression "$env:SystemDrive\AzureARC\Vars.ps1"

# Creating new Azure Arc resource group
az login --service-principal --username $env:appId --password $env:password --tenant $env:tenantId
az group create --location $env:location --name $env:resourceGroup --subscription $env:subscriptionId 