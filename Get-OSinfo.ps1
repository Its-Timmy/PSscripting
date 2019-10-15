# Get-CimInstance -class win32_operatingsystem -computer tserver `
# | Select-object BuildNumber, Caption, ServicePackMajorVersion

param (
    $computername= (Read-Host 'Enter a computer name')
)
Get-CimInstance -class win32_operatingsystem -computer $computername `
| Select-object BuildNumber, Caption, ServicePackMajorVersion