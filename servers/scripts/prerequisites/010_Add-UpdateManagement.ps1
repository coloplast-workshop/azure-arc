#requires -Version 3.0 -Modules Az.Automation, Az.Compute

<#
    .SYNOPSIS   
    Add Update Management

    .NOTES
    Name        : 010_Add-UpdateManagement.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

. "$(Split-Path $PSCommandPath -Resolve)/globals.env.ps1"

$startTime = (Get-Date -Date '02:00:00').AddDays(5)
$duration = New-TimeSpan -Hours 2
[DayOfWeek[]]$WeekendDay = [DayOfWeek]::Sunday
$schedule = New-AzAutomationSchedule -AutomationAccountName $automationAccountName -Name 'WeeklyCriticalSecurity' -StartTime $startTime -WeekInterval 1 -DaysOfWeek $WeekendDay -ResourceGroupName $resourceGroupName
$imediateUpdateStartTime = (Get-Date).AddHours(1)
$imediateUpdateSchedule = New-AzAutomationSchedule -AutomationAccountName $automationAccountName -Name 'FullUpdate' -StartTime $imediateUpdateStartTime -OneTime -ResourceGroupName $resourceGroupName -Verbose
$VMIDs = (Get-AzVM -ResourceGroupName $resourceGroupName).Id

#Software update - weekly
New-AzAutomationSoftwareUpdateConfiguration -ResourceGroupName $resourceGroupName -Schedule $schedule -Windows -AzureVMResourceId $VMIDs -Duration $duration -IncludedUpdateClassification Critical, Security, Definition -AutomationAccountName $automationAccountName

#Software update - one time
New-AzAutomationSoftwareUpdateConfiguration -ResourceGroupName $resourceGroupName -Schedule $imediateUpdateSchedule -Windows -AzureVMResourceId $VMIDs -Duration $duration -IncludedUpdateClassification Critical, Security, ServicePack, FeaturePack, UpdateRollup, Updates, Definition -AutomationAccountName $automationAccountName