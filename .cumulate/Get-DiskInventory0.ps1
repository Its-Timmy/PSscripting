<#
.SYNOPSIS 
This is a modified command, found on page 264 of our`
"learning powershell in a month of lunches" book
.EXAMPLE 
This only works with local-host
#>

$computername = 'localhost'
Get-ciminstance -class Win32_LogicalDisk `
-computername $computername `
-filter "drivetype=3" |
Sort-object -Property DeviceID |
Format-Table -Property DeviceID,
@{n='FreeSpace (MB)';e={$_.FreeSpace / 1MB -as [int]}},
@{n='Size (GB)';e={$_.Size / 1GB -as [int]}},
@{n='%Free';e={$_.FreeSpace / $_.Size * 100 -as [int]}}