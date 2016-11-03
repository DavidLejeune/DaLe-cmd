Write-host "Showing all available drives : " -ForegroundColor White
Write-Host "------------------------------`n" -ForegroundColor White

$Host.UI.RawUI.ForegroundColor = 'red'
.\lib\ps1\info-drives.ps1

$drive = Read-Host -Prompt '> Enter the target drive ';
$drive="$(($drive).ToUpper()):";


$StopWatch = [system.diagnostics.stopwatch]::startNew()
#import data
  $folders = Import-Csv -Delimiter "," -Path ".\lib\cmd-lets\backup-folders\backup_folders.csv"
  foreach ($folder in $folders)
    {
        #get csv Variables
        $source_folder = [char]34 + $folder.source_folder + [char]34
        $target_folder = $folder.target_folder
        $target_folder = [char]34 + "$($drive)$($target_folder)" + [char]34
        $Host.UI.RawUI.ForegroundColor = 'yellow'
        Write-Host "------------------------------------------------"
        Write-Host "Source folder : $($source_folder)"
        Write-Host "Target folder : $($target_folder)"
        Write-Host "------------------------------------------------"
        sleep(2)
        $Host.UI.RawUI.ForegroundColor = 'Blue'
        robocopy /E /R:1 /W:2  $source_folder $target_folder
        $StopWatch.Elapsed
        sleep(5)
    }

Write-host "`nShowing current drive status : "
Write-Host "------------------------------"
.\lib\ps1\info-drive.ps1
