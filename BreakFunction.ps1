
Function WorkerComputerInfo{
    Param($Computername)
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
Function Get-CompInfo {
<#
.SYNOPSIS
This is very similar to our CustomObject.ps1, except now we can pipe into it#>   
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true,Position=1,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [Alias('host')][String[]]$computername
    )
    BEGIN{}
    PROCESS{
        Foreach($name in $computername) {
            WorkerComputerInfo $name
        }
    }
    END{}
}

