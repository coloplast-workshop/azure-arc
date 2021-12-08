$globalsPath = ('{0}/globals.env.ps1' -f (Split-Path -Path $PSCommandPath -Resolve))
if (-not (Test-Path -Path $globalsPath)) 
{
  Write-Error -Message 'Globals env file not found next to this script'
  Exit 1
}
else 
{
  . $globalsPath
}
$subscription = (Get-AzSubscription -SubscriptionName $subscriptionName)
$subscription | Select-AzSubscription

try 
{
  Get-AzResourceGroup -Name $resourceGroup -ErrorAction Stop
} 
catch 
{
  New-AzResourceGroup -Name $resourceGroup -Location $location
}