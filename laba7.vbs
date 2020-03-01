'file_path = InputBox("File with path: ")
'intDays = InputBox("Date: ")
Option Explicit

Sub HelpFunc()
	Dim str
str = "Gets full file path and file name"&vbCrLf&"and date when a 	file should be deleted"&vbCrLf&"Time in format:12:00am"&vbCrLf&"File will be replace to Trash folder"&vbCrLf&"You can restore it using --restore file-name"&vbCrLf&"Example: .\script_name file.txt"&vbCrLf&"File 	will be restored to Restored folder"

	WScript.Echo str
End Sub

Dim help, menu
help = InputBox("Need help(y/n)?")
If help="y" Then Call HelpFunc

menu = InputBox("1 - Delete. 2 - Restore")

Dim file_path
Dim objFSO
Dim destination

Select Case menu
            Case "1"
            	WScript.Echo "You choose Delete. Please, enter file with path"
		destination = "D:\temp\Trash\"
		file_path = InputBox("File with path: ")
            Case "2"
            	WScript.Echo "You choose Restore. Please, enter file name"
		destination = "D:\temp\Restored\"
		file_path = InputBox("File name: ")
		file_path="D:\temp\Trash\" + file_path
Case Else
        WScript.Echo "Sorry. Invalid command"
	WScript.Quit 1
End Select


Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
If objFSO.FileExists(file_path) Then
	objFSO.MoveFile file_path, destination
Else
	WScript.Echo "Can't find file [" & file_path & "]."
	WScript.Quit 1
End If


WScript.Quit 0