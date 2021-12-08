# Deploy VcRedist and 7zip on Windows servers using a custom script

az deployment group create --resource-group **<name_of_the_resource_group>** --name **deploy_vcredist_7zip** --template-file **https://raw.githubusercontent.com/coloplast-workshop/azure-arc/main/servers/scripts/windows/custom_script/customscript.json** --parameters **https://raw.githubusercontent.com/coloplast-workshop/azure-arc/main/servers/scripts/windows/custom_script/customscript.parameters.json**

Resources:
* [custom script](https://azurearcjumpstart.io/azure_arc_jumpstart/azure_arc_servers/day2/arc_vm_extension_customscript_arm/)