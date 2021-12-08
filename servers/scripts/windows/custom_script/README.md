# Deploy applications on Windows servers using a custom script

az deployment group create --resource-group <Name of the Azure resource group> --template-file <The *customscript-templatewindows.json* template file location for Windows> --parameters <The *customscript-templatewindows.parameters.json* template file location>

Resources:
* [custom script](https://azurearcjumpstart.io/azure_arc_jumpstart/azure_arc_servers/day2/arc_vm_extension_customscript_arm/)