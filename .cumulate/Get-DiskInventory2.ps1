<#
.SYNOPSIS
Adding the use of a parameter. The default value is localhost.
We can assign a different computername at the command line, just
like how you use the 'Invoke-command -computername' parameter.
Its also in position 1
.EXAMPLE 
for local host: C:\PS> .\Get-DiskInventory2.ps1
C:\PS> .\Get-DiskInventory2.ps1 -ComputerName tserver
C:\PS> .\Get-DiskInventory2.ps1 tserver
#>
param(
$computername = 'localhost',
$drivetype = 3
)
Get-ciminstance -class Win32_LogicalDisk `
-computername $computername `
-filter "drivetype= $drivetype" |
Sort-object -Property DeviceID |
Format-Table -Property DeviceID,
@{n='FreeSpace (MB)';e={$_.FreeSpace / 1MB -as [int]}},
@{n='Size (GB)';e={$_.Size / 1GB -as [int]}},
@{n='%Free';e={$_.FreeSpace / $_.Size * 100 -as [int]}}