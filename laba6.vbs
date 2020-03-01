Set args = Wscript.Arguments
str = InputBox("Enter: ")
str = Replace(str, "sch","ω",1,-1,1)
str = Replace(str, "zh","ζ",1,-1,1)
str = Replace(str, "kh","υ",1,-1,1)
str = Replace(str, "ch","χ",1,-1,1)
str = Replace(str, "sh","ψ",1,-1,1)
str = Replace(str, "yu","ώ",1,-1,1)
str = Replace(str, "yo","ιξ",1,-1,1)
str = Replace(str, "ya","ÿ",1,-1,1)
str = Replace(str, "tc","φ",1,-1,1)

str = Replace(str,"b","α",1,-1,1)
str = Replace(str,"v","β",1,-1,1)
str = Replace(str,"g","γ",1,-1,1)
str = Replace(str,"d","δ",1,-1,1)
str = Replace(str,"e","ε",1,-1,1)
str = Replace(str,"z","η",1,-1,1)
str = Replace(str,"i","θ",1,-1,1)
str = Replace(str,"l","λ",1,-1,1)
str = Replace(str,"m","μ",1,-1,1)
str = Replace(str,"n","ν",1,-1,1)
str = Replace(str,"o","ξ",1,-1,1)
str = Replace(str,"p","ο",1,-1,1)
str = Replace(str,"r","π",1,-1,1)
str = Replace(str,"u","σ",1,-1,1)
str = Replace(str,"f","τ",1,-1,1)
str = Replace(str,"y","ϋ",1,-1,1)
str = Replace(str,"k","κ",1,-1,1)
str = Replace(str,"t","ς",1,-1,1)
str = Replace(str,"s","ρ",1,-1,1)
str = Replace(str,"c","κ",1,-1,1)

Wscript.Echo str
Set objFSO=CreateObject("Scripting.FileSystemObject")
outFile="c:\Users\user\result.txt"
Set objFile = objFSO.CreateTextFile(outFile,True)
objFile.Write str
objFile.Close