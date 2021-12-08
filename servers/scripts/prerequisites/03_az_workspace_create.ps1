. "$(Split-Path $PSCommandPath -Resolve)/00_az_commons.ps1"

try 
{
  Get-AzOperationalInsightsWorkspaceSharedKey -ResourceGroupName $resourceGroup -Name $workspaceName -ErrorAction Stop
} 
catch 
{
  New-AzOperationalInsightsWorkspace -Location $location -Name $workspaceName -Sku 'Standard' -ResourceGroupName $resourceGroup
}

$workspaceKey = (Get-AzOperationalInsightsWorkspaceSharedKey -ResourceGroupName $resourceGroup -Name $workspaceName)
$workspace = (Get-AzOperationalInsightsWorkspace -ResourceGroupName $resourceGroup -Name $workspaceName)
$WorkspaceDetails = @{
  'WorkspaceName' = $workspaceName
  'WorkspaceId' = $workspace.CustomerId
  'WorkspaceKey' = $workspaceKey.PrimarySharedKey
}

Write-Output -InputObject $WorkspaceDetails