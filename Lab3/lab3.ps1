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

Write-Output('F - Enter FIO')
Write-Output('N - Enter phone number')
Write-Output('G - Enter group number')
Write-Output('D - Enter birth date')

$choice = Read-Host -Prompt 'Enter your choice'

If($choice -eq 'F'){
  $fchoice = Read-Host -Prompt 'Enter surname'
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
} ElseIf($choice -eq 'N'){
  $nchoice = Read-Host -Prompt 'Enter number'
  $numberResult=findInNumber($nchoice)
  foreach($result in $numberResult){
    $name=$result.split(' ')[0]
    $number=$result.split(' ')[1]
    $groupResult=findInGroup($name)
    $birthResult=findInBirth($name)
    $group = findBySurname($groupResult)
    $birth = findBySurname($birthResult)
    Write-Host $name": "$number", "$group", "$birth
  }
} ElseIf($choice -eq 'G'){
  $gchoice = Read-Host -Prompt 'Enter group'
  $groupResult=findInGroup($gchoice)
  foreach($result in $groupResult){
    $name=$result.split(' ')[0]
    $group=$result.split(' ')[1]
    $numberResult=findInNumber($name)
    $birthResult=findInBirth($name)
    $number = findBySurname($numberResult)
    $birth = findBySurname($birthResult)
    Write-Host $name": "$number", "$group", "$birth
  }
} ElseIf($choice -eq 'D'){
  $bchoice = Read-Host -Prompt 'Enter birth date'
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
} Else {
  Write-Host 'Wrong choice!'
  exit 0;
}

Read-Host -Prompt 'Enter!'
