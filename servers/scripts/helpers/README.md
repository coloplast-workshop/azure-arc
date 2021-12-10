# Update all installed Az modules

Open a PowerShell prompt as Administrator and execute this command:<br/>

**Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/coloplast-workshop/azure-arc/main/servers/scripts/helpers/Update-AzModules.ps1'))**<br/>
