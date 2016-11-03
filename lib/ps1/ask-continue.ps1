write-host "" -ForegroundColor red
$Continue = Read-Host -Prompt 'Press enter to return to menu or q to quit ';
switch ($Continue)
    {
        q
          {
            .\lib\ps1\quit-this.ps1
          }

        default
          {
              #Write-Host "`nYou have selected $(($Menu2).ToUpper())`n";

              $Menu=$Menu0
              .\lib\ps1\startup.ps1
          }
    }
