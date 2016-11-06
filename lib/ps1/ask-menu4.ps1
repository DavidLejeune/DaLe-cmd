#Select action
$Host.UI.RawUI.ForegroundColor = 'white'
$Menu = Read-Host -Prompt 'Select an option ';
$Host.UI.RawUI.ForegroundColor = 'yellow'
$sw = [Diagnostics.Stopwatch]::StartNew()
switch ($Menu)
    {
      1
        {
          $Menu = "$(($Menu41).ToUpper())";
          .\lib\ps1\show-top.ps1;
          Write-Host ""
          $Host.UI.RawUI.ForegroundColor = 'magenta'
          Write-Host "Press [enter] to show all drives"
          $drive = Read-Host -Prompt 'or type a drive letter ';
          $drive="$(($drive).ToUpper()):";
          $Host.UI.RawUI.ForegroundColor = 'darkgreen'
          if ($drive.length -eq 2)
          {
            Write-Host ""
            .\lib\ps1\info-drive.ps1
          }
          if ($drive.length -eq 1)
          {
              Write-Host "Showing all drives.." -ForegroundColor white
                Write-Host ""
            .\lib\ps1\info-drives.ps1
          }
          .\lib\ps1\ask-continue.ps1;
        }

      2
        {
          $Menu = "$(($Menu42).ToUpper())";
          .\lib\ps1\show-top.ps1;
          $Host.UI.RawUI.ForegroundColor = 'blue'
          .\lib\ps1\check-security.ps1;
          .\lib\ps1\ask-continue.ps1;
        }

        3
          {
            $Menu = "$(($Menu43).ToUpper())";
            .\lib\ps1\show-top.ps1;
            Write-Host ""
            $Host.UI.RawUI.ForegroundColor = 'magenta'
            $directory = Read-Host -Prompt 'enter folder path to measure ';

            Write-Host "Measuring the shizznit out of this thing ..." -ForegroundColor white
            $Host.UI.RawUI.ForegroundColor = 'darkgreen'
            .\lib\ps1\get-directorysize.ps1;
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

                    ""
                      {
                          $Menu = "$(($Menu4).ToUpper())";
                        .\lib\ps1\show-top.ps1;
                        .\lib\ps1\show-menu4.ps1;
                        .\lib\ps1\ask-menu4.ps1;
                      }
        default {"The choice could not be determined."}
    }
