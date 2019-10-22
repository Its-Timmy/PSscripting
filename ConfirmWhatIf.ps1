#This doesn't work, but its a good example!!
#  Something about the $null values, I think the guy may be drunk (idk.)

<# To See Wtf he is referring to with the ForEach-Object, google "Change method of Win32_service class" 
I believe whats going on is that the 3 parameters in the function Set-ServicePassword are
Positionally ligned up with the 3 parameters in Function WorkerChangePW.
$Name cycles through the array of $computernames, each being used by $computername in WorkerChangePW
#>
Function WorkerChangePW {
    Param($Computername, $password,$Service)
    Get-CimInstance -class Win32_Service -ComputerName $computername -filter "name='$Service'"
    ForEach-Object -process { $_.Change($null,$null,$null,$null,$null,$null,$null,$password) |Out-Null}
}
Function Set-ServicePassword {
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact='Medium')]
    Param (
            [Parameter(Mandatory=$true,Position=1,ValueFromPipeline=$true, `
                    ValueFromPipelineByPropertyName=$true)]
            [Alias('host')]
            [string[]]$computername,
            [Parameter(Mandatory=$true)]
            [string]$Servicename,
            [Parameter(Mandatory=$true)]
            [String]$password
    )

    BEGIN{}
    PROCESS{
        foreach($name in $computername) {
            if ($pscmdlet.ShouldProcess("Setting password for $servicename on $name")) {
                WorkerChangePW $name $password $servicename
            }    
        }
    }
    END {}

}

