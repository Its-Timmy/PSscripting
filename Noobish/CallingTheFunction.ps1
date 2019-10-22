

Function Get-OSInfo {
    Param (
        $computername = 'localhost'
    )
$ans=Get-Ciminstance -Class Win32_OperatingSystem -computer $computername |
        Select-Object BuildNumber, Caption, ServicePackMajorVersion, ServicePackMinorVersion;
        $ans
}

Get-OSInfo