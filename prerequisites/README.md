# Azure Subscription preparations
You require sufficient permissions to create a Service Principal, Resource Group, Log Analytics Workspace, Automation Account and should be able to manage those resources as well<br/>

Create the folder **C:\Azure\prereqs** on your computer<br/>
Copy the powershell scripts from here to the folder **C:\Azure\prereqs** on your computer<br/>
Update the values in the file **globals.env.ps1**<br/>

Open a PowerShell prompt and go the folder **C:\Azure\prereqs**<br/>

> Step 1

Execute **001_Install-AzModules.ps1** to install the needed az modules<br/>

> Step 2

Execute **002_Invoke-AzLogin.ps1** to login to Azure<br/>

> Step 3

Execute **003_Register-ResourceProvider.ps1** to register the needed resource providers<br/><br/>**Wait for appx. 10 minutes**<br/><br/>

> Step 4

Execute **004_New-ResourceGroup.ps1** to create a resource group<br/>

> Step 5

Execute **005_New-ServicePrincipal.ps1** to create a service principal for Azure ARC<br/>

> Step 6

Execute **006_New-LogAnalyticsWorkspace.ps1** to create a log analytics workspace<br/>

> Step 7

Execute **007_New-AutomationAccount.ps1** to create a automation account<br/>

> Step 8

Execute **008_Enable-UpdateManagement.ps1** to enable Update Management<br/>

> Step 9

Execute **009_New-ResourceGroupDeployment.ps1** to create a new resource group deployment<br/>

> Step 10

Execute **010_Add-UpdateManagementSchedule.ps1** to add a update management schedule<br/>