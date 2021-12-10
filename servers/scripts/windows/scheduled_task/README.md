# Install the Azure Arc Agent on Windows using a startup script

> Step 1

Create the folder **C:\Azure\ARC** on the target computer<br/>
Copy **Install-AzureArcAgent.ps1** to the folder **C:\Azure\ARC** on the target computer<br/>
Copy **Set-Vars.ps1** to the folder **C:\Azure\ARC** on the target computer<br/>

> Step 2

Execute **Set-Vars.ps1** to create environment variables on the target computer<br/>

> Step 3

Execute **Install-AzureArcAgent.ps1** to install and configure the Azure ARC agent on the target computer<br/>
**Restart the computer**<br/>