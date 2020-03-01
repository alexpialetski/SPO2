$fchoice = 'Pialetski'
$numberResult=findInNumber($fchoice)
foreach($object in $numberResult){
  $name=$object.split(' ')[0]
  $groupResult=findInGroup($name)
  $birthResult=findInBirth($name)
  Write-Host $groupResult
  Write-Host $birthResult
}

function findInGroup($pattern){
  return Get-Content -Path group.txt | Where-Object {$_ -match $pattern}
}

function findInNumber($pattern){
  return Get-Content -Path number.txt | Where-Object {$_ -match $pattern}
}

function findInBirth($pattern){
  return Get-Content -Path birth.txt | Where-Object {$_ -match $pattern}
}


    WScript.Echo surname & "  " & name & "  " & StrComp(surname, name)
