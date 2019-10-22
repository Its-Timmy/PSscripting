# You can pipe into this function
# Apparently, it requires BEGIN {} PROCESS {} and END {}
# PROCESS {} is the only mandatory block
# We are using $computername = $_ for readability. We could just use $_

Function Get-OSInfo{
    BEGIN {}
    PROCESS{
        $computername = $_
        Get-CimInstance -Class Win32_OperatingSystem -computer $computername |
            Select-Object PSComputername, Name, BuildNumber, Caption, `
                ServicePackMajorVersion;          
    }
    END{}
    

}