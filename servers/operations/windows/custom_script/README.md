# Defrag the system drive on Windows servers using a custom script

az deployment group create --resource-group **<name_of_the_resource_group>** --name **defrag_sysdrive** --template-file **https://raw.githubusercontent.com/coloplast-workshop/azure-arc/main/servers/operations/windows/custom_script/customscript.json** --parameters **https://raw.githubusercontent.com/coloplast-workshop/azure-arc/main/servers/operations/windows/custom_script/customscript.parameters.json**

Resources:
* [custom script](https://azurearcjumpstart.io/azure_arc_jumpstart/azure_arc_servers/day2/arc_vm_extension_customscript_arm/)