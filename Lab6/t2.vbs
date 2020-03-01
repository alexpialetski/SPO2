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
    surname = Split(line, " ")
    If surname(0) = name Then
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
    data = Split(line, " ")
    If data(1) = pattern Then
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
surname = ""
For Each line in groupResult.Items
  surname = Split(line, " ")(0)
  Set result10 = findBySurname(numberResult, surname)
  Set result11 = findBySurname(birthResult, surname)
  WScript.Echo line
  call outputArray(result1)
  call outputArray(result2)
 Next
Set result1 = findBySurname(groupResult, "Pialetski")
Set result2 = findByData(groupResult, "720601")
Set result3 = findByData(numberResult, "+375293571371")
Set result4 = findByData(birthResult, "23.04.2000")