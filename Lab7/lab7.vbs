Set objShell = CreateObject("Wscript.Shell")
Dim fso, file_path, MyFile
file_path = InputBox("Enter file destination:")
Set fso = CreateObject("Scripting.FileSystemObject")

If Not fso.FolderExists(file_path) Then
Set newfolder = fso.CreateFolder(file_path)
End If 

Set MyFile = fso.CreateTextFile(file_path & "/report.txt", True)
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

Set colSettings = objWMIService.ExecQuery _
    ("Select * from Win32_OperatingSystem")

For Each objOperatingSystem in colSettings
    MyFile.WriteLine("OS Name: " & objOperatingSystem.Name)
    MyFile.WriteLine("Version: " & objOperatingSystem.Version)
    MyFile.WriteLine("Service Pack: " & _
        objOperatingSystem.ServicePackMajorVersion _
            & "." & objOperatingSystem.ServicePackMinorVersion)
    MyFile.WriteLine("OS Manufacturer: " & objOperatingSystem.Manufacturer)
    MyFile.WriteLine("Windows Directory: " & _
        objOperatingSystem.WindowsDirectory)
    MyFile.WriteLine("Locale: " & objOperatingSystem.Locale)
    MyFile.WriteLine("Available Physical Memory: " & _
        objOperatingSystem.FreePhysicalMemory)
    MyFile.WriteLine("Total Virtual Memory: " & _
        objOperatingSystem.TotalVirtualMemorySize)
    MyFile.WriteLine("Available Virtual Memory: " & _
        objOperatingSystem.FreeVirtualMemory)
    MyFile.WriteLine("Size stored in paging files: " & _
        objOperatingSystem.SizeStoredInPagingFiles)
Next

Set colSettings = objWMIService.ExecQuery _
    ("Select * from Win32_ComputerSystem")

For Each objComputer in colSettings
    MyFile.WriteLine("System Name: " & objComputer.Name)
    MyFile.WriteLine("System Manufacturer: " & objComputer.Manufacturer)
    MyFile.WriteLine("System Model: " & objComputer.Model)
    MyFile.WriteLine("Time Zone: " & objComputer.CurrentTimeZone)
    MyFile.WriteLine("Total Physical Memory: " & _
        objComputer.TotalPhysicalMemory)
Next

Set colSettings = objWMIService.ExecQuery _
    ("Select * from Win32_Processor")

For Each objProcessor in colSettings
    MyFile.WriteLine("System Type: " & objProcessor.Architecture)
    MyFile.WriteLine("Processor: " & objProcessor.Description)
Next

Set colSettings = objWMIService.ExecQuery _
    ("Select * from Win32_BIOS")

For Each objBIOS in colSettings
    MyFile.WriteLine("BIOS Version: " & objBIOS.Version)
Next
MyFile.WriteLine("Disc D:")
Call ShowFolderList(MyFile, "D://")
MyFile.WriteLine("Disc C:")
Call ShowFolderList(MyFile, "C://")
MyFile.close()

Sub ShowFolderList(MyFile, folderspec)
    Dim fs, f, f1, s, sf
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set f = fs.GetFolder(folderspec)
    Set sf = f.SubFolders
    For Each f1 in sf
		MyFile.WriteLine("	" & f1.name)
    Next
End Sub

