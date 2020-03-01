Function readFile(file)
  Set fso = CreateObject("Scripting.FileSystemObject") 
  Set readFile = CreateObject("Scripting.Dictionary")
  Set file = fso.OpenTextFile (file, 1)
  row = 0
  Do Until file.AtEndOfStream
    line = file.Readline
    readFile.Add row, line
    row = row + 1
  Loop

  file.Close
End Function

Function findBySurname(dict, name)
  Set findBySurname = CreateObject("Scripting.Dictionary")
  row = 0
  surname = ""
  For Each line in dict.Items
    surname = Split(line, " ")(0)
    If StrComp(surname, name) =  0 Then
	  WScript.Echo surname & "  " & name & "  " & StrComp(surname, name)
  	  findBySurname.Add row, line
  	  row = row + 1
    End if
  Next
End Function

Function findByData(dict, pattern)
  Set findByData = CreateObject("Scripting.Dictionary")
  row = 0
  data = ""
  For Each line in dict.Items
    data = Split(line, " ")(1)
    If StrComp(data, pattern) =  0 Then
  	  findByData.Add row, line
  	  row = row + 1
    End if
  Next
End Function

Sub outputArray(dict)
  For Each line in dict.Items
    WScript.Echo line
  Next
End Sub


Set groupResult = readFile("group.txt")
Set numberResult = readFile("number.txt")
Set birthResult = readFile("birth.txt")
Set test = findBySurname(groupResult, "Pialetski")
  call outputArray(test)
surname = ""
For Each line in test.Items
  surname = Split(line, " ")(0)
  Set result10 = findBySurname(numberResult, surname)
  Set result11 = findBySurname(birthResult, surname)
'  call outputArray(result10)
 ' call outputArray(result11)
Next