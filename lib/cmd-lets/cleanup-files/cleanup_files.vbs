Set objFSO = CreateObject("Scripting.FileSystemObject")

iTotal = 0


'This is the folder where all your shit will be moved to in an orderly fashion
filename = ".\lib\cmd-lets\cleanup-files\target_folder.txt"
Set f = objFSO.OpenTextFile(filename,1)
strLine = f.ReadLine
objTargetFolder = strLine
f.Close
objTargetFolder = strLine


'For each folder (subfolders not included) file will be moved to target folder
filename = ".\lib\cmd-lets\cleanup-files\cleanup_folders.txt"
Set f = objFSO.OpenTextFile(filename,1)
Do Until f.AtEndOfStream
  strLine = f.ReadLine
  objStartFolder = strLine
  call Main
Loop
f.Close

Wscript.Echo ""
Wscript.Echo " #####################################################"
Wscript.Echo " #               PROGRAM CONCLUDED                   #"
Wscript.Echo " #                    HOORAAAH                       #"
Wscript.Echo " #####################################################"
Wscript.Echo ""
Wscript.Echo ""

















Sub Main()



iNew = 0
iCount = 0
Set objFolder = objFSO.GetFolder(objStartFolder)

Set colFiles = objFolder.Files
sDelete = 0


Wscript.Echo ""
Wscript.Echo "Folder : " & objStartFolder

For Each objFile in colFiles

    strinput = objFile.Name
    If instr(strinput,".") >0 Then
        sType = Ucase( Mid(strinput,instrRev(strinput,".")+1))
        If instr(sType,".") >0 Then
            sType = Ucase( Mid(sType,instrRev(sType,".")+1))
        End If
    End If

    If Len(sType) > 4 Then
    If instr(sType,".") >0 Then
            sType = Ucase( Mid(sType,instrRev(sType,".")+1))
        End If
    End If


    sDestinationFolder = objTargetFolder + sType + "\"
    'Wscript.echo sDestinationFolder
    If NOT (objFSO.FolderExists(sDestinationFolder)) Then
        objFSO.CreateFolder(sDestinationFolder)

        Wscript.Echo ""
        Wscript.Echo "#########################"
        Wscript.Echo "# Subfolder " & sType & " created #"
        Wscript.Echo "#########################"
        Wscript.Echo ""
        Wscript.Sleep 300
        iNew = iNew + 1
    End If
    sName = objFile.Name
    If objFSO.FileExists(sDestinationFolder & sName) Then

    objFSO.DeleteFile sDestinationFolder & sName
    sDelete = sDelete + 1
    else
    iCount = iCount + 1
    End If

    objFSO.MoveFile objFile.Path , sDestinationFolder & sName
    Wscript.Echo "[" & sType & "]" & vbTab & sName



Next


Wscript.Echo "Created " & iNew & " new Type Folder(s)" & vbCrlf & "Moved " & sDelete & " duplicate file(s)" & vbCrlf & "Moved " & iCount & " new file(s)"
Wscript.Sleep 3500


End Sub
