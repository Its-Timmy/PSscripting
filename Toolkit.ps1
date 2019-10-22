<#
You can load both ot these functions using dot sourcing.
. .\toolkit.ps1
#>
function Get-OSInfo {
<#
.SYNOPSIS
Retrieves basic OS info
.PARAMETER Computername
The computer that you want to run this command on.
.EXAMPLE
Get-OSInfo -computername tserver
#>
    Param(
    [Parameter(Mandatory=$true)]    
        $computername
)

    Get-ciminstance -class Win32_OperatingSystem `
        -computer $computername |
        Select-object Buildnumber, Caption, ServicePackMajorVersion
}

function Get-BIOSInfo {
<#
.SYNOPSIS
Essentially, this is just a shortcut to the win32_Bios info
.PARAMETER Computername
The name of the computer to query for BIOS information
.EXAMPLE
Get-BIOSInfo -computername tserver
#>
    param (
        [Parameter(mandatory=$true)]
            $computername
    )
        Get-CimInstance -class Win32_Bios `
            -computer $computername 

}