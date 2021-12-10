# Update all installed Az modules

Open a PowerShell prompt as Administrator and execute this command:<br/>

**Set-ExecutionPolicy Bypass -Scope Process -Force; [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/coloplast-workshop/azure-arc/main/servers/scripts/helpers/Update-AzModules.ps1'))**