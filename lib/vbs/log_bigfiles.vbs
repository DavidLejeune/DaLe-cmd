Set objFSO = CreateObject("Scripting.FileSystemObject")

WScript.StdOut.Write("Enter the path to search for big files > ")
WScript.StdIn.Read(0)
objStartFolder = WScript.StdIn.ReadLine()



iTotalWithout = 0
iTotal = 0
iTooMuch = 0
iCount = 0

del = "N"
call Main()

Wscript.Echo ""
Wscript.Echo ""
Wscript.Echo ""
Wscript.Echo ""


WScript.StdOut.Write("Enter the path to search for big files > ")
WScript.StdIn.Read(0)
del = WScript.StdIn.ReadLine()


Sub Main()

Set objFolder = objFSO.GetFolder(objStartFolder)

Set colFiles = objFolder.Files
For Each objFile in colFiles
    'Wscript.Echo objFile.Name
    iTotal = iTotal + objFile.Size
    iTotalWithout = iTotalWithout + objFile.Size
            If objFile.Size /1024 /1024 /1024 > 1 Then
                iCount = iCount + 1
                Wscript.Echo "PATH > " & Replace(objFile.Path , objFile.Name , "")
                Wscript.Echo "NAME > " & objFile.Name
                Wscript.Echo "SIZE > " & Left(objFile.Size /1024 /1024 /1024,4) & " Gb"
                Wscript.Echo ""
                iTooMuch = iTooMuch + objFile.Size
                iTotalWithout = iTotalWithout - objFile.Size


                'objFSO.DeleteFile objFile.Path


                'Wscript.Echo "File deleted"
            End If






Next
strDel = strDel
ShowSubfolders objFSO.GetFolder(objStartFolder)
Wscript.Echo "---------------------------------------------------------"
Wscript.Echo "Found " & iCount & " files larger than 1 Gb totaling " & Left(iTooMuch /1024 /1024 /1024,4) & " Gb"
Wscript.Echo "Total path size : " & Left(iTotal / 1024 / 1024 / 1024,4) & " Gb"
Wscript.Echo "Possible Total path size : " & Left(iTotalWithout / 1024 / 1024 / 1024,4) & " Gb"
Wscript.Echo "---------------------------------------------------------"


End Sub





Sub ShowSubFolders(Folder)
    For Each Subfolder in Folder.SubFolders
    On Error Resume Next

        'Wscript.Echo Subfolder.Path
        Set objFolder = objFSO.GetFolder(Subfolder.Path)

        Set colFiles = objFolder.Files
        For Each objFile in colFiles
        On Error Resume Next

            iTotal = iTotal + objFile.Size
            iTotalWithout= iTotalWithout + objFile.Size
            If objFile.Size /1024 /1024 /1024 > 1 Then
                iCount = iCount + 1
                Wscript.Echo "PATH > " & Replace(objFile.Path , objFile.Name , "")
                Wscript.Echo "NAME > " & objFile.Name
                Wscript.Echo "SIZE > " & Left(objFile.Size /1024 /1024 /1024,4) & " Gb"
                Wscript.Echo ""
                iTooMuch = iTooMuch + objFile.Size
                iTotalWithout = iTotalWithout - objFile.Size

                'objFSO.DeleteFile objFile.Path
                'Wscript.Echo "File deleted"
            End If


        Next
        'Wscript.Echo
        ShowSubFolders Subfolder
    Next
End Sub
