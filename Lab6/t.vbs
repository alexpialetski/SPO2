
GetNumberOfLines("group.txt")
Function GetNumberOfLines(file)
  Set fso = CreateObject("Scripting.FileSystemObject") 
  Set theFile = fso.OpenTextFile(file, 8, True) 
  WScript.Echo theFile.Line 
  theFile.Close
End Function