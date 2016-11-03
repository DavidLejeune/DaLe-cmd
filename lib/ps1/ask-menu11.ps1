#Select action
$Menu = Read-Host -Prompt 'Select an option ';
$sw = [Diagnostics.Stopwatch]::StartNew()
switch ($Menu)
    {
        1
          {
            $Menu = "$(($Menu111).ToUpper())";
            .\lib\ps1\show-top.ps1;
            .\lib\cmd-lets\cleanup-files\cleanup-files.ps1;
            .\lib\ps1\ask-continue.ps1;
          }

        2
          {
            $Menu = "$(($Menu112).ToUpper())";
            .\lib\ps1\show-top.ps1;
            .\lib\cmd-lets\cleanup-files\show-paths;
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
