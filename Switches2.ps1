<# Break makes it so the command will stop once the condition
is met.
.SYNOPSIS
Adding wildcard support for switches
.DESCRIPTION
You dont have to put in the * when inputting a value for
the computername.
.EXAMPLE
PS> .\Switches2.ps1   :: Follow prompts, use wildcards
#>

$computername = read-host 'Enter a Computer name'
Switch -Wildcard($computername) {
    'dc*' {
        Write-Output 'Domain Controller Selected'
}
    '*las*' {
        Write-Output 'Las Vegas Selected'
        Break
    }
    '*den' {
        Write-Output 'Denver Selected'
        Break
    }
    'LocalHost' {
        Write-Output 'Local Machine Selected'
    }
    'ts*'   {
        Write-output 'tserver Selected'
    }
    'td*' {
        Write-Output 'tdesktop selected'
    }
    Default {
        Write-Warning 'Unknown Computer'
    }
}