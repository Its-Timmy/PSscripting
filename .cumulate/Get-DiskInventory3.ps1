<#
.SYNOPSIS
Get-DiskInventory retrieves logical disk information from one
or more computers.
.DESCRIPTION
Get-DiskInventory uses CIM to retrieve the Win32_LogicalDisk
instances from one or more computers. It displays each disk's
drive letter, free space, total size, and percentage of free
space.
.PARAMETER computername
The computername, or names, to query. Default: Localhost
.PARAMETER drivetype
The drive type to query. See Win32_LogicalDisk documentation
for values. 3 is a fixed disk, and is the default.
.EXAMPLE 
Get-DiskInventory -ComputerName tserver -drivetype 3
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