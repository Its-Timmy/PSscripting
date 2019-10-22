<#
.SYNOPSIS
Retrieve information on physical network adapters
.Description
Uses CIM to enumerate physical NICs
.Parameter computername
The name of the computer to query
.Example
PS> .\Get-PhysicalAdapters.ps1 -computername tserver
.Example
PS> .\Get-PhysicalAdapters.ps1 -hostname tserver
#>

Param(
[Parameter(Mandatory=$true,HelpMessage="feed computername")]
    [Alias('hostname')]
    $computername
)
Write-Verbose "Gathering physical NIC information from '$computername'"
Get-ciminstance Win32_NetworkAdapter -computername $computername|
    where { $_.PhysicalAdapter } |
    Select MACAddress, AdapterType, DeviceID, Name, Speed
Write-Verbose "All done"