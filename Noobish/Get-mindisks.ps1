<#  This one is kinda weird.. but w/e!
.SYNOPSIS
Determine which drives have less than the specified amount of 
free space.
.Description
This command will return local drives, specified by drive type,
that have LESS that a queried amount of free space.
.Parameter Computername
Specify the computer to run the command against.
.Parameter Drivetype
Specify the type of drive to check by Win32_LogicalDisk value
0=unknown, 1=No root directory, 2=removable disk, 3=local disk,
4= network drive, 5=Compact Disk, 6=Ram Disk
.Example
.\get-mindisks.ps1 -computername tserver -drivetype 3 -minpercentfree 80
#>

Param(
    $computername = 'localhost',
    $drivetype = 3,
    $minpercentfree = 100
)

Get-ciminstance win32_logicalDisk -computername $computername `
-Filter "drivetype= $drivetype" |
Where-object `
{ ($_.FreeSpace / $_.Size * 100 -as [int]) -lt $minpercentfree} |
Select-Object -property DeviceID, 
    @{n='Size(GB)';e={$_.'size' /1GB -as [int]}},
    @{n='FreeSpace(GB)';e={$_.'freespace' /1GB -as [int]}},
    @{n='PercentFree';e={$_.'freespace' / $_.'size' *100 -as [int]}}