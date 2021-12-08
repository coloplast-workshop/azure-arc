<#
    .SYNOPSIS   
    Install applications from using chocolatey
    Run script using custom script extention

    .NOTES
    Name        : Install-Applications.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

$chocolateyExist = ((Test-Path -Path $env:ChocolateyInstall) -and (Test-Path -Path "$env:ChocolateyInstall\bin\Choco.exe"))
$chocolateyAppList = '7zip,vscode'
$appsToInstall = $chocolateyAppList -split ',' | ForEach-Object -Process {
  ('{0}' -f $_.Trim())
}

if (-not ($chocolateyExist))
{
  Write-Output -InputObject 'Chocolatey not detected, trying to install'
  Invoke-Expression -Command ((New-Object -TypeName 'System.Net.WebClient').DownloadString('https://chocolatey.org/install.ps1'))
}
foreach ($app in $appsToInstall)
{
  Write-Output -InputObject ('Installing {0}' -f $app)
  & "$env:ProgramData\Chocolatey\bin\Choco.exe" install $app -y | Write-Output
}