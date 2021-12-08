if (-not (Test-Path -Path "$env:ProgramFiles(x86)\microsoft sdks\azure\cli2\wbin\az.cmd"))
{
  Write-Error -Message 'Azure CLI is not installed. Stop'
  Exit 1
}

& "$env:ProgramFiles(x86)\microsoft sdks\azure\cli2\wbin\az.cmd" tag create --name 'Hosting Platform'
& "$env:ProgramFiles(x86)\microsoft sdks\azure\cli2\wbin\az.cmd" tag add-value --name 'Hosting Platform' --value 'Azure'
& "$env:ProgramFiles(x86)\microsoft sdks\azure\cli2\wbin\az.cmd" tag add-value --name 'Hosting Platform' --value 'AWS'
& "$env:ProgramFiles(x86)\microsoft sdks\azure\cli2\wbin\az.cmd" tag add-value --name 'Hosting Platform' --value 'GCP'
& "$env:ProgramFiles(x86)\microsoft sdks\azure\cli2\wbin\az.cmd" tag add-value --name 'Hosting Platform' --value 'On-premises'