<#
    .SYNOPSIS   
    Defrag the system drive
    Run script using custom script extention

    .NOTES
    Name        : Invoke-Defragmentation.ps1
    Author      : Lars Krogh Paulsen
    DateCreated : 2021-12-08
    Version     : 0.0.1
#>

$volumes = Get-WmiObject -Class 'Win32_Volume'
$sysDrive = $volumes | Where-Object -FilterScript {
  $_.Name -eq "$env:SystemDrive\" 
}
$sysDrive.defraganalysis().defraganalysis
$sysDrive.defrag($true)