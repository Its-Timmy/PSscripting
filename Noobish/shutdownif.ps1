Write-output "enter 0 to stop-computer"
$action = Read-host "What will it be?"

if ($action -eq 0) {
    Stop-Computer
}
Else {
    Start-process notepad
}