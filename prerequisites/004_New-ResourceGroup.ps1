<#
    .SYNOPSIS   
    Create a new resource group

    .NOTES
    Name        : 004_New-ResourceGroup.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

. "$(Split-Path $PSCommandPath -Resolve)/globals.env.ps1"

if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue))
{
  New-AzResourceGroup -Name $resourceGroupName -Location $location
}