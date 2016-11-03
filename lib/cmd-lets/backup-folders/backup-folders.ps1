Write-host "Showing all available drives : "
Write-Host "------------------------------`n"
.\lib\ps1\info-drives.ps1

$drive = Read-Host -Prompt '> Enter the target drive ';
$drive="$(($drive).ToUpper()):";
Write-Host $drive

Write-host "`nShowing current drive status : "
Write-Host "------------------------------`n"
.\lib\ps1\info-drive.ps1
