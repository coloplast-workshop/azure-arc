<#
    .SYNOPSIS   
    Add Update Management

    .NOTES
    Name        : 010_Add-UpdateManagement.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

$resourceGroup = 'rg-azure-arc'
$startTime = (Get-Date -Date '02:00:00').AddDays(5)
$duration = New-TimeSpan -Hours 2
[DayOfWeek[]]$WeekendDay = [DayOfWeek]::Sunday
$automationAccountName = (Get-AzAutomationAccount -ResourceGroupName $resourceGroup).AutomationAccountName 
$schedule = New-AzAutomationSchedule -AutomationAccountName $automationAccountName -Name 'WeeklyCriticalSecurity' -StartTime $startTime -WeekInterval 1 -DaysOfWeek $WeekendDay -ResourceGroupName $resourceGroup
$imediateUpdateStartTime = (Get-Date).AddHours(1)
$imediateUpdateSchedule = New-AzAutomationSchedule -AutomationAccountName $automationAccountName -Name 'FullUpdate' -StartTime $imediateUpdateStartTime -OneTime -ResourceGroupName $resourceGroup -Verbose
$VMIDs = (Get-AzVM -ResourceGroupName $resourceGroup).Id

#Software update - weekly
New-AzAutomationSoftwareUpdateConfiguration -ResourceGroupName $resourceGroup -Schedule $schedule -Windows -AzureVMResourceId $VMIDs -Duration $duration -IncludedUpdateClassification Critical, Security, Definition -AutomationAccountName $automationAccountName

#Software update - one time
New-AzAutomationSoftwareUpdateConfiguration -ResourceGroupName $resourceGroup -Schedule $imediateUpdateSchedule -Windows -AzureVMResourceId $VMIDs -Duration $duration -IncludedUpdateClassification Critical, Security, ServicePack, FeaturePack, UpdateRollup, Updates, Definition -AutomationAccountName $automationAccountName