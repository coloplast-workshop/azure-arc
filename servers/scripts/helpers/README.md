# Update all installed Az modules

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/coloplast-workshop/azure-arc/main/servers/scripts/helpers/Update-AzModules.ps1'))