# <--- Change the following environment variables according to your Azure service principal name --->

# Azure variables
$env:subscription_id = 'Your Azure subscription ID'
$env:servicePrincipalClientId = 'Your Azure service principal name'
$env:servicePrincipalSecret = 'Your Azure service principal password'
$env:tenant_id = 'Your Azure tenant ID'
$env:resourceGroup = 'Azure resource group name where the Azure Arc servers will be onboarded to'
$env:location = 'Azure Region' # For example: "westeurope"

# VMware vSphere variables
$env:vCenterAddress = 'vCenter FQDN/IP'
$env:vCenterUser = 'vCenter user account' #Example: administrator@vsphere.local
$env:vCenterUserPassword = 'vCenter user account password'
$env:SrcPath = 'Folder location of the downloaded scripts' # For example: C:\AzureARC\
$env:VMFolder = 'The vCenter folder where the VMs are located'
$env:OSAdmin = 'An Administrator user account for the VM'
$env:OSAdminPassword = 'An Administrator user account for the VM'