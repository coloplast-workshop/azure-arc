# Deploy 7zip and VScode on Windows servers using a custom script

az deployment group create --resource-group <Name of the Azure resource group> --template-file **customscript-templatewindows.json** --parameters **customscript-templatewindows.parameters.json**

Resources:
* [custom script](https://azurearcjumpstart.io/azure_arc_jumpstart/azure_arc_servers/day2/arc_vm_extension_customscript_arm/)