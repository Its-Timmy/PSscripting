
$age = read-host "How old are you?"

if($age -ge 21) {
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