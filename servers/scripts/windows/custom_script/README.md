# Deploy VcRedist and 7zip on Windows servers using a custom script

az deployment group create --resource-group **Name of the resource group** --name **Name of the deployment** --template-file https://raw.githubusercontent.com/coloplast-workshop/azure-arc/main/servers/scripts/windows/custom_script/customscript.json --parameters https://raw.githubusercontent.com/coloplast-workshop/azure-arc/main/servers/scripts/windows/custom_script/customscript.parameters.json

Resources:
* [custom script](https://azurearcjumpstart.io/azure_arc_jumpstart/azure_arc_servers/day2/arc_vm_extension_customscript_arm/)