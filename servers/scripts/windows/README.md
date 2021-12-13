# Install the Azure Arc Agent on Windows

> Step 1

Create the folder **C:\Azure\ARC** on the target computer<br/>
Copy **Install-AzureArcAgent.ps1** to the folder **C:\Azure\ARC** on the target computer<br/>
Copy **Set-Vars.ps1** to the folder **C:\Azure\ARC** on the target computer<br/>

> Step 2

Execute **Set-Vars.ps1** to create environment variables on the target computer<br/>

> Step 3

Execute **Install-AzureArcAgent.ps1** to install and configure the Azure ARC agent on the target computer<br/>

# Install the Azure Arc Agent on Windows V2

> Step 1

Create the folder **C:\Azure\ARC** on the target computer<br/>
Copy **Install-AzureArcAgent_v2.ps1** to the folder **C:\Azure\ARC** on the target computer<br/>
Copy **Set-Vars_v2.ps1** to the folder **C:\Azure\ARC** on the target computer<br/>
Copy **AzureCloud.xml** to the folder **C:\Azure\ARC** on the target computer<br/>

> Step 2

Update the xml file **C:\Azure\ARC\AzureCloud.xml** with required values your Azure subscription

> Step 3

Execute **Set-Vars_v2.ps1** to create environment variables on the target computer<br/>

> Step 4

Execute **Install-AzureArcAgent.ps1** to install and configure the Azure ARC agent on the target computer<br/>


> Troubleshoot

[Agent connection issues](https://docs.microsoft.com/en-us/azure/azure-arc/servers/troubleshoot-agent-onboard#agent-error-codes/)<br/>
[VM extensions](https://docs.microsoft.com/en-us/azure/azure-arc/servers/troubleshoot-vm-extensions#general-troubleshooting/)