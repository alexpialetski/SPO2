$fchoice = 'Pialetski'
$groupResult=findInGroup($fchoice)
Write-Host $groupResult

function findInGroup($pattern){
  return Get-Content -Path group.txt | Where-Object {$_ -match $pattern}
}

