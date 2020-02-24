$choice = Read-Host -Prompt 'Enter your choice'
New-Item -Path $choice -ItemType Directory  
$result=fsutil fsinfo drives
$drives = $result[1].split(' ')
For($i=1; $i -lt $drives.Length; $i++ ){
  dir $drives[$i] >> $choice"\report.txt"
}
Get-ComputerInfo >> $choice"\report.txt"
cd $choice
Write-Output "File in"
Get-Location