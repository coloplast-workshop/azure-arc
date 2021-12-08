# Azure Subscription preparations
You require sufficient permissions to create a Service Principal, Resource Group, Log Analytics Workspace, Automation Account and should be able to manage those resources as well<br/>

> Step 1
Create the folder **C:\AzureARC** on your computer<br/>
Copy the powershell scripts (.ps1) from here to the folder **C:\AzureARC** on your computer<br/>
Update the Azure subscription name in the file **globals.env.ps1**<br/>

> Step 2
Create a Resource Group (if not exist) for this Azure Arc PoC<br/>
Execute **00_az_commons.ps1** from the folder **C:\AzureARC** on your computer to create a azure resource group<br/>

> Step 3
Register your Subscription for the Azure Arc Providers required to manage your resources<br/>
Execute **01_az_provider_registration_apply.ps1** from the folder **C:\AzureARC** on your computer to register the azure resource providers<br/>
Wait for appx. 10 minutes<br/>

> Step 4
Create a Service Principal with just enough permission to enroll VMs into Azure Arc<br/>
Execute **02_az_service_principal_create.ps1** from the folder **C:\AzureARC** on your computer<br/>

> Step 5
Create the Log Analytics Workspace for Azure Arc machines<br/>
Execute **03_az_workspace_create.ps1** from the folder **C:\AzureARC** on your computer<br/>