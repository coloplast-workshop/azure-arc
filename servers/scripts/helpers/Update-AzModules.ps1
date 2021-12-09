#requires -RunAsAdministrator

Get-Module -Name az.* -ListAvailable |
Where-Object -Property Name -NE -Value 'Az.' |
ForEach-Object -Process {
  $currentVersion = [Version] $_.Version
  $newVersion = [Version] (Find-Module -Name $_.Name).Version
  if ($newVersion -gt $currentVersion) 
  {
    Write-Output -InputObject ('Updating {0} Module from {1} to {2}' -f $_, $currentVersion, $newVersion)
    Update-Module -Name $_.Name -RequiredVersion $newVersion -Force
    Uninstall-Module -Name $_.Name -RequiredVersion $currentVersion -Force
  }
}