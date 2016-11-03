#Select action
$Host.UI.RawUI.ForegroundColor = 'white'
$Menu = Read-Host -Prompt 'Select an option ';
$Host.UI.RawUI.ForegroundColor = 'yellow'
$sw = [Diagnostics.Stopwatch]::StartNew()
switch ($Menu)
    {
        1
          {
            $Menu = "$(($Menu1).ToUpper())";
            .\lib\ps1\show-top.ps1;
            .\lib\ps1\show-menu1.ps1;
            .\lib\ps1\ask-menu1.ps1;
          }

        2
          {
            $Menu = "$(($Menu2).ToUpper())";
            .\lib\ps1\show-top.ps1;
            .\lib\ps1\show-menu2.ps1;
            .\lib\ps1\ask-menu2.ps1;
          }

        3
          {
            $Menu = "$(($Menu3).ToUpper())";
            .\lib\ps1\show-top.ps1;
            .\lib\ps1\show-menu3.ps1;
            .\lib\ps1\ask-menu3.ps1;
          }

        q
          {
            .\lib\ps1\quit-this.ps1
          }

        99
          {
              #Write-Host "`nYou have selected $(($Menu99).ToUpper())`n";
              $Menu = "$(($Menu99).ToUpper())";
              .\lib\ps1\show-top.ps1;
              .\lib\ps1\show-description.ps1;
              .\lib\ps1\ask-continue.ps1;
          }

          ""
            {
                #Write-Host "`nYou have selected $(($Menu99).ToUpper())`n";
                $Menu = $Menu0
                .\lib\ps1\startup.ps1
            }

        default {"The choice could not be determined."}
    }
