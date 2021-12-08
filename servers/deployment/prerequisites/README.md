# How-to
Create the folder **C:\AzureARC** on your computer<br/>
Copy the powershell scripts (.ps1) from here to the folder **C:\AzureARC** on your computer<br/>
Update the Azure subscription name in the file **globals.env.ps1**<br/>
Run **00_az_commons.ps1** from the folder **C:\AzureARC** on your computer to create a azure resource group<br/>
Run **01_az_provider_registration_apply.ps1** from the folder **C:\AzureARC** on your computer to register the azure resource providers<br/>
Wait for appx. 10 minutes<br/>
Run **02_az_service_principal_create.ps1** from the folder **C:\AzureARC** on your computer to create a azure service principal<br/>
Run **03_az_workspace_create.ps1** from the folder **C:\AzureARC** on your computer to create a azure operational insights workspace<br/>