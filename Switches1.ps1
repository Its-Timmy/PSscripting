<#
.DESCRIPTION
A simple demonstation of using switches
.EXAMPLE
PS> .\Switches1.ps1    :: Then follow prompts
#>

$computername = Read-Host "Enter a computername"
switch ($computername) {
    'tserver' {
        Write-Host "Server 2019 Evaluation Trial"
    }
    'localhost' {
        Write-Host "This computer, right here, is the localhost"
    }
    Default {
        Write-Output "unknown endpoint"
    }
}