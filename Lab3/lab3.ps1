'' > report.txt

'Task 1' >> report.txt
ipconfig /all | Where-Object {$_ -match '(^(?!  )|(Default Gateway)|(IPv4))|(Mask)'} | Where-Object {$_ -ne ''} >> report.txt
‘’>>report.txt

'Task 2' >> report.txt
getmac /v /fo list >> report.txt
‘’>>report.txt

'Task 3' >> report.txt
ipconfig /all >> report.txt
ping asus.com >>report.txt
‘’>>report.txt

'Task 4' >> report.txt
ipconfig /all | Where-Object {$_ -match '(^(?!  )|(Default Gateway))'} | Where-Object {$_ -ne ''} >> report.txt
‘’ >> report.txt
ping asus.com >> report.txt
‘’>>report.txt

'Task 5' >> report.txt
$string = ping 192.168.1.1 | Where-Object {$_ -match 'Average'}
$string -match 'Average = .*ms' >$null 2>&1
‘Bandwidth:’ >> report.txt
32 / $matches[0].split('=')[1].Replace('ms', '') >> report.txt
‘’>>report.txt

'Task 6' >> report.txt
tracert -h 5 asus.com >> report.txt
‘’>>report.txt

'Task 7’ >> report.txt
tracert asus.com >> report.txt
‘’>>report.txt

'Task 8’ >> report.txt
pathping -q 10 -n asus.com >> report.txt
‘’>>report.txt

'Task 9’ >> report.txt
arp -a >> report.txt
‘’>>report.txt

'Task 10’ >> report.txt
netstat -n -a >> report.txt
‘’>>report.txt

'Task 11’ >> report.txt
ping asus.com -f -n 1 -l 1436 >> report.txt
ping asus.com -f -n 1 -l 1437 >> report.txt
‘’>>report.txt
