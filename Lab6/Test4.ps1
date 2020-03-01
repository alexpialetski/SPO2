$fchoice = 'Pialetski'
$numberResult=findInNumber($fchoice)
foreach($result in $numberResult){
  $name=$result.split(' ')[0]
  $number=$result.split(' ')[1]
  $groupResult=findInGroup($name)
  $birthResult=findInBirth($name)
  $group = findBySurname($groupResult)
  $birth = findBySurname($birthResult)
  Write-Host $name": "$number", "$group", "$birth
}

function findBySurname($fromFile, $name){
  if(!$fromFile -Or ($fromFile -is [array] -And $fromFile.Length -eq 0)){
    return ''
  }
  if($fromFile -is [array]){
    $row = $fromFile[0]
  }else {
    $row = $fromFile
  }

  if($row -match $name){
    return $row.split(' ')[1]
  }
  return ''
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

