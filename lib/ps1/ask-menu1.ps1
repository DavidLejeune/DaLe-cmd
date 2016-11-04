#Select action
$Host.UI.RawUI.ForegroundColor = 'white'
$Menu = Read-Host -Prompt 'Select an option ';
$Host.UI.RawUI.ForegroundColor = 'yellow'
$sw = [Diagnostics.Stopwatch]::StartNew()
switch ($Menu)
    {
        1
          {
            $Menu = "$(($Menu11).ToUpper())";
            .\lib\ps1\show-top.ps1;
            .\lib\ps1\show-menu11.ps1;
            .\lib\ps1\ask-menu11.ps1;
          }

        2
          {
            $Menu = "$(($Menu12).ToUpper())";
            .\lib\ps1\show-top.ps1;
            cscript //nologo .\lib\vbs\log_bigfiles.vbs
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
