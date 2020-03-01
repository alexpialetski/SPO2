Dim fchoice, groupResult()
fchoice = "Pialetski"
Set groupResult = findInGroup(fchoice)
WScript.Echo groupResult

Function findInGroup(pattern)
  i = 0
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.OpenTextFile(filename)
  filename = "group.txt"
  ReDim findInGroup(GetNumberOfLines(filename))

  Do Until f.AtEndOfStream
    WScript.Echo f.ReadLine
	findInGroup(i) = f.ReadLine
	i = i + 1
  Loop

  f.Close
End Function

Function GetNumberOfLines(file)
  Set fso = CreateObject("Scripting.FileSystemObject") 
  Set theFile = fso.OpenTextFile(file, 8, True) 
  WScript.Echo theFile.Line 
  theFile.Close
End Function
