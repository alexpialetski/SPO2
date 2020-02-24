Write-Output('F - Enter FIO')
Write-Output('N - Enter phone number')
Write-Output('G - Enter group number')
Write-Output('D - Enter birth date')

$choice = Read-Host -Prompt 'Enter your choice'

If($choice -eq 'F'){
  $fchoice = Read-Host -Prompt 'Enter surname'
  $groupResult=findInGroup($fchoice)
  ForEach-Object -InputObject $groupResult -Process {
    $name=$_.split(' ')[0]
    $numberResult=findInNumber($fchoice)
    $birthResult=findInBirth($fchoice)
  }
} ElseIf($choice -eq 'N'){

} ElseIf($choice -eq 'G'){

} ElseIf($choice -eq 'D'){

} Else {
    exit 0;
}

printResult($groupResult, $birthResult, $numberResult)

function printResult($groupResult, $birthResult, $numberResult){
   ForEach-Object -InputObject $groupResult -Process {
     $fio = $_.split(' ')[0];
     $group = $_.split(' ')[1];
     $birth = findBySurname($birthResult, $fio)
     $number = findBySurname($numberResult, $fio)
     Write-Host $fio" - "$group" - "$birth" - "$number
   }
}

function findBySurname($fromFile, $name){
  if($fromFile.GetType().name -ne 'Object[]'){
    $fromFile=@($fromFile)
  }
  $result=@("")
  ForEach-Object -InputObject $fromFile -Process { 
    if($_ -match $name){
      $result = $result + $_
    }
  }
  if($result.Count -eq 1){
    return ''
  } else {
    return $result[1].split(' ')[1]
  }  
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
