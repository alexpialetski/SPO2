Set args = Wscript.Arguments
str = InputBox("Enter: ")
str = Replace(str, "sch","�",1,-1,1)
str = Replace(str, "zh","�",1,-1,1)
str = Replace(str, "kh","�",1,-1,1)
str = Replace(str, "ch","�",1,-1,1)
str = Replace(str, "sh","�",1,-1,1)
str = Replace(str, "yu","�",1,-1,1)
str = Replace(str, "yo","��",1,-1,1)
str = Replace(str, "ya","�",1,-1,1)
str = Replace(str, "tc","�",1,-1,1)

str = Replace(str,"b","�",1,-1,1)
str = Replace(str,"v","�",1,-1,1)
str = Replace(str,"g","�",1,-1,1)
str = Replace(str,"d","�",1,-1,1)
str = Replace(str,"e","�",1,-1,1)
str = Replace(str,"z","�",1,-1,1)
str = Replace(str,"i","�",1,-1,1)
str = Replace(str,"l","�",1,-1,1)
str = Replace(str,"m","�",1,-1,1)
str = Replace(str,"n","�",1,-1,1)
str = Replace(str,"o","�",1,-1,1)
str = Replace(str,"p","�",1,-1,1)
str = Replace(str,"r","�",1,-1,1)
str = Replace(str,"u","�",1,-1,1)
str = Replace(str,"f","�",1,-1,1)
str = Replace(str,"y","�",1,-1,1)
str = Replace(str,"k","�",1,-1,1)
str = Replace(str,"t","�",1,-1,1)
str = Replace(str,"s","�",1,-1,1)
str = Replace(str,"c","�",1,-1,1)

Wscript.Echo str
Set objFSO=CreateObject("Scripting.FileSystemObject")
outFile="c:\Users\user\result.txt"
Set objFile = objFSO.CreateTextFile(outFile,True)
objFile.Write str
objFile.Close