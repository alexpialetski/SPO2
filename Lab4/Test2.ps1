$fchoice = 'Pialetski'
$groupResult=findInGroup($fchoice)
$numberResult=findInNumber($fchoice)
$birthResult=findInBirth($fchoice)
Write-Host $groupResult
Write-Host $numberResult
Write-Host $birthResult

function findInGroup($pattern){
  return Get-Content -Path group.txt | Where-Object {$_ -match $pattern}
}

function findInNumber($pattern){
  return Get-Content -Path number.txt | Where-Object {$_ -match $pattern}
}

function findInBirth($pattern){
  return Get-Content -Path birth.txt | Where-Object {$_ -match $pattern}
}

