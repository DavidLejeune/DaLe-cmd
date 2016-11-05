#Select action
$Host.UI.RawUI.ForegroundColor = 'white'
$Menu = Read-Host -Prompt 'Select an option ';
$Host.UI.RawUI.ForegroundColor = 'yellow'
$sw = [Diagnostics.Stopwatch]::StartNew()
switch ($Menu)
    {
      1
        {
          $Menu = "$(($Menu51).ToUpper())";
          .\lib\ps1\show-top.ps1;
          shutdown.exe /s /t 1
        }

      2
        {
          $Menu = "$(($Menu52).ToUpper())";
          .\lib\ps1\show-top.ps1;
          $Host.UI.RawUI.ForegroundColor = 'white'
          Write-Host "showing all drives"
          $Host.UI.RawUI.ForegroundColor = 'green'
          .\lib\ps1\info-drives.ps1
          $Host.UI.RawUI.ForegroundColor = 'magenta'
          $drive = Read-Host -Prompt 'Type a drive letter of media to eject';
          $drive="$(($drive).ToUpper()):";
          $Host.UI.RawUI.ForegroundColor = 'darkgreen'
          if ($drive.length -eq 2)
          {
            .\lib\ps1\eject-media.ps1
            Write-Host "It is now safe to remove the device" -ForegroundColor white
          }
          if ($drive.length -eq 1)
          {
              Write-Host "You didn't enter shit" -ForegroundColor red

          }
          .\lib\ps1\ask-continue.ps1;
        }



        66
          {
              $Menu = "$(($Menu66).ToUpper())";
              .\lib\ps1\startup.ps1
          }
        q
          {
            .\lib\ps1\quit-this.ps1
          }

        default {"The choice could not be determined."}
    }
