Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force -ErrorAction Ignore

$ErrorActionPreference = 'stop'

Remove-Item -Path WSMan:\Localhost\listener\listener* -Recurse

& "$env:ComSpec" /c winrm quickconfig -q
& "$env:ComSpec" /c winrm quickconfig '-transport:http'
& "$env:ComSpec" /c winrm set 'winrm/config' '@{MaxTimeoutms="1800000"}'
& "$env:ComSpec" /c winrm set 'winrm/config/winrs' '@{MaxMemoryPerShellMB="1024"}'
& "$env:ComSpec" /c winrm set 'winrm/config/service' '@{AllowUnencrypted="true"}'
& "$env:ComSpec" /c winrm set 'winrm/config/client' '@{AllowUnencrypted="true"}'
& "$env:ComSpec" /c winrm set 'winrm/config/service/auth' '@{Basic="true"}'
& "$env:ComSpec" /c winrm set 'winrm/config/client/auth' '@{Basic="true"}'
& "$env:ComSpec" /c winrm set 'winrm/config/service/auth' '@{CredSSP="true"}'
& "$env:ComSpec" /c winrm set 'winrm/config/listener?Address=*+Transport=HTTP' '@{Port="5985"}'
& "$env:ComSpec" /c netsh advfirewall firewall set rule group="remote administration" new enable=yes
& "$env:ComSpec" /c netsh advfirewall firewall add rule name="Open Port 5985" dir=in action=allow protocol=TCP localport=5985
& "$env:ComSpec" /c net stop winrm
& "$env:ComSpec" /c sc config winrm start= auto
& "$env:ComSpec" /c net start winrm 