#This is erroring out, but lets look into try, catch, and throw.



Try {[double]$age = Read-Host "How old are you?"}
Catch {Write-Output "You have to enter a number, try again"; Exit}

Write-Output "You signified that you are $age years old"

if ($age -ge 115){
    Write-output "Damn! You're old as shit!"
}
elseif ($age -le 0){
    Write-Output "Really, you're $age`? You are literally not alive yet."
}
elseif ($age -ge 21) {
    Write-Output "You can go to the bar, yay!"
} 
elseif ($age -ge 16) {
    Write-Output "You can legally drive, but can't go bar hopping."
}
elseif ($age -le 15) {
    Write-Output "You can't even legally drive yet!"
}   
else {
    Write-Output "I fucked up this code somewhere"
}