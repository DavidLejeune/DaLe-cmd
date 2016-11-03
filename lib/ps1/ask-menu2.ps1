#Select action
$Menu = Read-Host -Prompt 'Select an option ';
$sw = [Diagnostics.Stopwatch]::StartNew()
switch ($Menu)
    {
        1
          {
            $Menu = "$(($Menu21).ToUpper())";
            .\lib\ps1\show-top.ps1;
            .\lib\cmd-lets\backup-folders\backup-folders.ps1;
            .\lib\ps1\ask-continue.ps1;
          }

        2
          {
            $Menu = "$(($Menu22).ToUpper())";
            .\lib\ps1\show-top.ps1;
            write-host "Note : full target-folder is built with drive choice (@ Do Backup)";
            import-csv .\lib\cmd-lets\backup-folders\backup-folders.csv;
            .\lib\ps1\ask-continue.ps1;
          }
        3
          {
            $Menu = "$(($Menu23).ToUpper())";
            .\lib\ps1\show-top.ps1;
            notepad .\lib\cmd-lets\backup-folders\backup-folders.csv;
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
