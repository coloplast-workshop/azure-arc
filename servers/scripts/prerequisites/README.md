# Azure Subscription preparations
You require sufficient permissions to create a Service Principal, Resource Group, Log Analytics Workspace, Automation Account and should be able to manage those resources as well<br/>

Create the folder **C:\Azure\prereqs** on your computer<br/>
Copy the powershell scripts (.ps1) from here to the folder **C:\Azure\prereqs** on your computer<br/>
Update the Azure subscription name in the file **globals.env.ps1**<br/>

> Step 1

Open a PowerShell prompt<br/>
Execute **001_Install-AzModules.ps1** from the folder **C:\Azure\prereqs** on your computer to install the needed az modules<br/>

> Step 2

Execute **002_Invoke-AzLogin.ps1** from the folder **C:\Azure\prereqs** on your computer to login to Azure<br/>

> Step 3

Execute **003_Register-ResourceProvider.ps1** from the folder **C:\Azure\prereqs** on your computer to register the needed resource providers<br/>
Wait for appx. 10 minutes<br/>

> Step 4

Execute **004_New-ResourceGroup.ps1** from the folder **C:\Azure\prereqs** on your computer to create a resource group<br/>

> Step 5

Execute **005_New-ServicePrincipal.ps1** from the folder **C:\Azure\prereqs** on your computer to create a service principal for Azure ARC<br/>

> Step 6

Execute **006_New-LogAnalyticsWorkspace.ps1** from the folder **C:\Azure\prereqs** on your computer to create a log analytics workspace<br/>

> Step 7

Execute **007_New-AutomationAccount.ps1** from the folder **C:\Azure\prereqs** on your computer to create a automation account<br/>

> Step 8

Execute **008_Enable-UpdateManagement.ps1** from the folder **C:\Azure\prereqs** on your computer to enable Update Management<br/>

> Step 9

Execute **009_New-ResourceGroupDeployment.ps1** from the folder **C:\Azure\prereqs** on your computer to create a new resource group deployment<br/>

> Step 10

Execute **010_Add-UpdateManagementSchedule.ps1** from the folder **C:\Azure\prereqs** on your computer to add a update management schedule<br/>