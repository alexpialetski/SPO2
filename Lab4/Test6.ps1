$bchoice = '23.04.2000'
$birthResult=findInBirth($bchoice)
foreach($result in $birthResult){
  $name=$result.split(' ')[0]
  $birth=$result.split(' ')[1]
  $numberResult=findInNumber($name)
  $groupResult=findInGroup($name)
  $number = findBySurname($numberResult)
  $group = findBySurname($groupResult)
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

