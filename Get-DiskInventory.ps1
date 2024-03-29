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
[ValidateSet(2,3)]
.EXAMPLE 
Get-DiskInventory -ComputerName tserver -drivetype 3
.NOTES
Changed Format-Table to Select Object, so that powershell can
do its own formatting with it, if necessary.
Added [CmdletBinding()], mandatory parameter, alias, verbose
#>
[CmdletBinding()]
param(
[Parameter(mandatory=$True,HelpMessage="Feed me a computer name")]
    [Alias('hostname')]
    [string]$computername,
    [ValidateSet(2,3)]
    [int]$drivetype = 3
)
Write-Verbose "Connecting to $computername"
Write-Verbose "Looking for drive type $drivetype"
Get-ciminstance -class Win32_LogicalDisk `
-computername $computername `
-filter "drivetype= $drivetype" |
Sort-object -Property DeviceID |
Select-Object -Property DeviceID,
    @{n='FreeSpace (MB)';e={$_.FreeSpace / 1MB -as [int]}},
    @{n='Size (GB)';e={$_.Size / 1GB -as [int]}},
    @{n='%Free';e={$_.FreeSpace / $_.Size * 100 -as [int]}}
Write-Verbose "Finished running command"