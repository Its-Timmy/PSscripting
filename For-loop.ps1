
Try {[int]$num = Read-Host "Enter a number less than 10"}
Catch {Write-Output "Numbers less that 10 please";Exit}

If ($num -ge 10) {
    Write-output "$num is not less than 10, goodbye!";
    exit
}

For ($num; $num -lt 10; $num++) {
    Write-output $num
}
Write-output "Done!"