Set objFSO = CreateObject("Scripting.FileSystemObject")

WScript.StdOut.Write("Enter the path to search for big files > ")
WScript.StdIn.Read(0)
objStartFolder = WScript.StdIn.ReadLine()
WScript.StdOut.Write("Enter size of a big file (in MB) > ")
WScript.StdIn.Read(0)
objMB = WScript.StdIn.ReadLine()

objMB = objMB * 1


Wscript.Echo ""

iTotalWithout = 0
iTotal = 0
iCount = 0
iDeleted = 0
iNew = 0

del = "N"
call Main()

Wscript.Echo ""
Wscript.Echo "What do you want to do with these big files?"
Wscript.Echo ""
Wscript.Echo "  1. Delete with confirmation"
Wscript.Echo "  2. Auto delete "
Wscript.Echo ""
Wscript.Echo "  press ENTER to exit this menu"
Wscript.Echo ""
WScript.StdOut.Write("Enter your choice > ")
WScript.StdIn.Read(0)
del = WScript.StdIn.ReadLine()

If del = "N" Then
Wscript.Echo "Bye bye birdie"
End If
If del = "1" Then
call Main()
End If
If del = "2" Then
call Main()
End If

Sub Main()

iTooMuch = 0
Set objFolder = objFSO.GetFolder(objStartFolder)

Set colFiles = objFolder.Files
For Each objFile in colFiles
    'Wscript.Echo objFile.Name
    iTotal = iTotal + objFile.Size
    iTotalWithout = iTotalWithout + objFile.Size
            If objFile.Size /1024 /1024  > objMB Then
                iCount = iCount + 1
                Wscript.Echo ""
                Wscript.Echo "PATH > " & Replace(objFile.Path , objFile.Name , "")
                Wscript.Echo "NAME > " & objFile.Name
                Wscript.Echo "SIZE > " & Left(objFile.Size /1024 /1024 ,4) & " MB"
                iTooMuch = iTooMuch + objFile.Size
                iTotalWithout = iTotalWithout - objFile.Size


                If del = "1" Then
                    WScript.StdOut.Write("Delete this file? (y/N)> ")
                    WScript.StdIn.Read(0)
                    del2 = WScript.StdIn.ReadLine()
                    If Ucase(del2) = "Y" Then
                      iDeleted = iDeleted + objFile.Size
                      objFSO.DeleteFile objFile.Path
                      Wscript.Echo "File deleted"
                    End If

                    If Ucase(del2) = "N"  or del2 = "" then
                      Wscript.Echo "You pussied out .."
                    End If

                End If


                If del = "2" Then
                  iDeleted = iDeleted + objFile.Size
                  objFSO.DeleteFile objFile.Path
                  Wscript.Echo "File deleted"
                End If



                'Wscript.Echo "File deleted"
            End If






Next
strDel = strDel
ShowSubfolders objFSO.GetFolder(objStartFolder)
Wscript.Echo "---------------------------------------------------------"
Wscript.Echo "Found " & iCount & " files larger than " & objMB & " MB totaling " & Left(iTooMuch /1024 /1024,4) & " MB"
Wscript.Echo "Total path size : " & Left(iTotal / 1024 / 1024,4) & " MB"
if iDeleted > 0 Then
  iNew = iTotal - iDeleted
  Wscript.Echo "New Total path size : " & Left(iNew / 1024 / 1024,4) & " MB"
Else
  Wscript.Echo "Possible Total path size : " & Left(iTotalWithout / 1024 / 1024 ,4) & " MB"
End If
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
            If objFile.Size /1024 /1024  > objMB Then
                iCount = iCount + 1
                Wscript.Echo ""
                Wscript.Echo "PATH > " & Replace(objFile.Path , objFile.Name , "")
                Wscript.Echo "NAME > " & objFile.Name
                Wscript.Echo "SIZE > " & Left(objFile.Size /1024 /1024 ,4) & " MB"
                iTooMuch = iTooMuch + objFile.Size
                iTotalWithout = iTotalWithout - objFile.Size


                If del = "1" Then
                    WScript.StdOut.Write("Delete this file? (y/N)> ")
                    WScript.StdIn.Read(0)
                    del2 = WScript.StdIn.ReadLine()
                    If Ucase(del2) = "Y" Then
                      iDeleted = iDeleted + objFile.Size
                      objFSO.DeleteFile objFile.Path
                      Wscript.Echo "File deleted"
                    End If

                    If Ucase(del2) = "N"  or del2 = "" then
                      Wscript.Echo "You pussied out .."
                    End If

                End If


                If del = "2" Then
                iDeleted = iDeleted + objFile.Size
                  objFSO.DeleteFile objFile.Path
                  Wscript.Echo "File deleted"
                End If


            End If


        Next
        'Wscript.Echo
        ShowSubFolders Subfolder
    Next
End Sub
