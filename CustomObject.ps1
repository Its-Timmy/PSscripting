<# You can load this function by using dot sourcing.
. .\CustomObjects.ps1
#>
Function Get-CompInfo{
<#
.DESCRIPTION
Practice with a custom made object to display
.PARAMETER Computername
The name of the computer that you want to query.
.EXAMPLE
PS> .\CustomObject.ps1 -computername tserver
#>
    Param(
        [String]$computername = 'localhost'
    )
    $os = Get-CimInstance -class Win32_OperatingSystem -ComputerName $computername
    $bios = Get-CimInstance -class Win32_BIOS -computername $computername
    $disk = get-ciminstance -class Win32_LogicalDisk -Filter "DeviceID='C:'" -ComputerName $computername

    $obj = New-Object -TypeName PSObject
    $obj | Add-Member -MemberType NoteProperty -Name ComputerName -Value $computername
    $obj | Add-Member -MemberType NoteProperty -Name SPVersion -Value $os.ServicePackMajorVersion
    $obj | Add-Member -MemberType NoteProperty -Name OSversion -Value $os.caption
    $obj | Add-Member -MemberType NoteProperty -Name OSBuild -Value $os.BuildNumber
    $obj | Add-Member -MemberType NoteProperty -Name BIOSserial -value $bios.SerialNumber
    $obj | Add-Member -MemberType NoteProperty -Name SystemFree -Value $disk.FreeSpace
    
    Write-output $obj
}

Get-CompInfo

