# Here is how we make help information.
# It requires .KeyWords

<#
.SYNOPSIS
Retrieves BIOS information from a computer
.DESCRiption
Uses CIM to collect BIOS information from a remote computer
.Parameter computername
The computer name of IP address to query
.example
Get-BIOSInfo -computername Tserver
.Example
Get-BIOSInfo tserver
#>

param ($computername = 'localhost')
Get-CimInstance -class win32_Bios -computername $computername