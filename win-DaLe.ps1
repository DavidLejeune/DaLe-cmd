

#------------------------------------------------------------------------------
#Script Variables
$DC1 = "POLIFORMADL"
$DC2 = "COM"

$Menu = "Home of the Command Line Cowboy"
$Menu1 = "Create new OU";
$Menu2 = "New User"
$Menu3 = "Bulk Usermanagement based on CSV"
$Menu4 = "Check User existence"
$Menu5 = "Bulk delete User from CSV"
$Menu6 = "Show all users"
$Menu7 = "Delete a user"
$Menu99 = "Show Description"


#------------------------------------------------------------------------------
#Functions

function show-logo(){
	#feed the narcistic beast
	.\lib\ps1\show-logo.ps1
}


function show-menuheader(){
	#feed the narcistic beast
	echo ' #####################################'
	echo "    $Menu                "
	echo ' #####################################'
	echo ''
}


function Log-Action()
{
  $Date = Get-Date
  $Entry = $Date.ToString() + "," + $env:username.ToString() + "," + $Menu.ToString() + ","+ $time_elapsed + ","
  Add-Content .\log\script_logbook.csv $Entry
}



#------------------------------------------------------------------------------
#Script


show-logo;
show-menuheader;

#Select action
$Menu = Read-Host -Prompt 'Select an option ';
$sw = [Diagnostics.Stopwatch]::StartNew()
switch ($Menu)
    {
        1
          {
              Write-Host "`nYou have selected $(($Menu1).ToUpper())`n";
              $Menu = $Menu1;
              Create-OU;
          }

        2
          {
              Write-Host "`nYou have selected $(($Menu2).ToUpper())`n";
              $Menu = $Menu2;
              Create-User;
          }

        3
          {
              Write-Host "`nYou have selected $(($Menu3).ToUpper())`n";
              $Menu = $Menu3;
              Bulk-UserManagement;
          }

        4
          {
              Write-Host "`nYou have selected $(($Menu4).ToUpper())`n";
              $Menu = $Menu4;
              Check-UserExistence;
          }
        5
          {
              Write-Host "`nYou have selected $(($Menu5).ToUpper())`n";
              $Menu = $Menu5;
              Bulk-UserDelete;
          }
        6
          {
              Write-Host "`nYou have selected $(($Menu6).ToUpper())`n";
              $Menu = $Menu6;
              Show-Users;
          }
        7
          {
              Write-Host "`nYou have selected $(($Menu7).ToUpper())`n";
              $Menu = $Menu7;
              Delete-User;
          }
        99
          {
              Write-Host "`nYou have selected $(($Menu99).ToUpper())`n";
              $Menu = $Menu99;
              Show-Description;
          }

        default {"The choice could not be determined."}
    }

    $sw.Stop()
    $time_elapsed = $sw.Elapsed.TotalSeconds
    Write-Host " *** Task completed in "$time_elapsed" seconds. ***"
    Log-Action
