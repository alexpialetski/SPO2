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
  findBySurname = ""
  For Each line in dict.Items
    fbs = Split(line, " ")(0)
    If fbs = name Then
  	  findBySurname = Split(line, " ")(1)
    End if
  Next
End Function

Function findByData(dict, pattern)
  Set findByData = CreateObject("Scripting.Dictionary")
  row = 0
  For Each line in dict.Items
    data = Split(line, " ")
    If data(1) = pattern Then
  	  findByData.Add row, line
  	  row = row + 1
    End if
  Next
End Function

Function findInFileBySurname(dict, pattern)
  Set findInFileBySurname = CreateObject("Scripting.Dictionary")
  row = 0
  For Each line in dict.Items
    data1 = Split(line, " ")(0)
    If data1 = pattern Then
  	  findInFileBySurname.Add row, line
  	  row = row + 1
    End if
  Next
End Function

Set groupResult = readFile("group.txt")
Set numberResult = readFile("number.txt")
Set birthResult = readFile("birth.txt")

WScript.Echo "F - Enter FIO"&vbNewLine&"N - Enter phone number"&vbNewLine&"G - Enter group number"&vbNewLine&"D - Enter birth date"

choice = InputBox("Enter your choice")

Select Case choice
  Case "F"
    fchoice = InputBox("Enter surname")
    Set inital = findInFileBySurname(groupResult, fchoice)
    For Each line in inital.Items
      surname = Split(line, " ")(0)
      group = Split(line, " ")(1)
      number = findBySurname(numberResult, surname)
      birth = findBySurname(birthResult, surname)
      WScript.Echo surname&" - "&number&" - "&birth&" - "&group
    Next
  Case "N"
    nchoice = InputBox("Enter number")
	Set inital = findByData(numberResult, nchoice)
	For Each line in inital.Items
	  surname = Split(line, " ")(0)
      number = Split(line, " ")(1)
      group = findBySurname(groupResult, surname)
      birth = findBySurname(birthResult, surname)
      WScript.Echo surname&" - "&number&" - "&birth&" - "&group
    Next
  Case "G"
    gchoice = InputBox("Enter group")
    Set inital = findByData(groupResult, gchoice)
    For Each line in inital.Items
      surname = Split(line, " ")(0)
      group = Split(line, " ")(1)
      number = findBySurname(numberResult, surname)
      birth = findBySurname(birthResult, surname)
      WScript.Echo surname&" - "&number&" - "&birth&" - "&group
    Next
  Case "D"
    bchoice = InputBox("Enter birth")
    Set inital = findByData(birthResult, bchoice)
    For Each line in inital.Items
      surname = Split(line, " ")(0)
      birth = Split(line, " ")(1)
      number = findBySurname(numberResult, surname)
      group = findBySurname(groupResult, surname)
      WScript.Echo surname&" - "&number&" - "&birth&" - "&group
    Next
  Case Else
    WScript.Echo "Wrong choice"
End Select
