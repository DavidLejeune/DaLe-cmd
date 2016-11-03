

#------------------------------------------------------------------------------
#Script Variables
$DC1 = "POLIFORMADL"
$DC2 = "COM"

$Menu = ""
$Menu0 = "Home of the Command Line Cowboy"
$Menu=$Menu0

$Menu1 = "Handle files"
  $Menu11 = "Cleanup files to File Hub"
    $Menu111 = "Do cleanup"
    $Menu112 = "Show cleanup folders & target folder"
  $Menu12 = "Log/Cleanup big files"

$Menu2 = "Backup"
  $Menu21 = "Start Backup"

$Menu3 = "Handle GIT repositories"
  $Menu31 = "Backup GIT repositories"

$Menu66 = "Back to main menu"
$Menu99 = "Show description"


function show-menu1()
{
  #making this script sexy
    Write-Host " Menu Files :";
    Write-Host "";
    Write-Host '    1. '$Menu11;
    Write-Host '    2. '$Menu12;
    Write-Host '   ';
    Write-Host '    66.'$Menu66;
    Write-Host "";
}

function show-menu2()
{
  #making this script sexy
    Write-Host " Menu Backup :";
    Write-Host "";
    Write-Host '    1. '$Menu21;
    Write-Host '    2. '$Menu22;
    Write-Host '   ';
    Write-Host '    66.'$Menu66;
    Write-Host "";
}

function show-menu3()
{
  #making this script sexy
    Write-Host " Menu GIT :";
    Write-Host "";
    Write-Host '    1. '$Menu31;
    Write-Host '    2. '$Menu32;
    Write-Host '   ';
    Write-Host '    66.'$Menu66;
    Write-Host "";
}

function Log-Action()
{
  $Date = Get-Date
  $Entry = $Date.ToString() + "," + $env:username.ToString() + "," + $Menu.ToString() + ","+ $time_elapsed + ","
  Add-Content .\log\script_logbook.csv $Entry
}

function show-top()
{
  .\lib\ps1\show-logo.ps1
  .\lib\ps1\show-menuheader;
}

function ask-menumain()
{
  #Select action
  $Menu = Read-Host -Prompt 'Select an option ';
  $sw = [Diagnostics.Stopwatch]::StartNew()
  switch ($Menu)
      {
          1
            {
              $Menu = "$(($Menu1).ToUpper())";
              show-top;
              show-menu1;
              ask-menu1;
            }

          2
            {
              $Menu = "$(($Menu2).ToUpper())";
              show-top;
              show-menu2;
              ask-menu2;
            }

          3
            {
              $Menu = "$(($Menu3).ToUpper())";
              show-top;
              show-menu3;
              ask-menu3;
            }

          q
            {
              quit-this
            }

          99
            {
                #Write-Host "`nYou have selected $(($Menu99).ToUpper())`n";
                $Menu = "$(($Menu99).ToUpper())";
                show-top;
                .\lib\ps1\show-description.ps1;
                ask-continue;
            }

            ""
              {
                  #Write-Host "`nYou have selected $(($Menu99).ToUpper())`n";
                  $Menu = $Menu0
                  startup
              }

          default {"The choice could not be determined."}
      }


}


function ask-menu1()
{
  #Select action
  $Menu = Read-Host -Prompt 'Select an option ';
  $sw = [Diagnostics.Stopwatch]::StartNew()
  switch ($Menu)
      {
          1
            {
              $Menu = "$(($Menu11).ToUpper())";
              show-top;
            }

          2
            {
              $Menu = "$(($Menu12).ToUpper())";
              show-top;
            }

          66
            {
                $Menu = "$(($Menu66).ToUpper())";
                startup
            }
          q
            {
              quit-this
            }

          default {"The choice could not be determined."}
      }


}

function ask-menu2()
{
  #Select action
  $Menu = Read-Host -Prompt 'Select an option ';
  $sw = [Diagnostics.Stopwatch]::StartNew()
  switch ($Menu)
      {
          1
            {
              $Menu = "$(($Menu21).ToUpper())";
              show-top;
            }

          2
            {
              $Menu = "$(($Menu22).ToUpper())";
              show-top;
            }

          66
            {
                $Menu = "$(($Menu66).ToUpper())";
                startup
            }
          q
            {
              quit-this
            }

          default {"The choice could not be determined."}
      }


}


function ask-menu3()
{
  #Select action
  $Menu = Read-Host -Prompt 'Select an option ';
  $sw = [Diagnostics.Stopwatch]::StartNew()
  switch ($Menu)
      {
          1
            {
              $Menu = "$(($Menu31).ToUpper())";
              show-top;
            }

          2
            {
              $Menu = "$(($Menu32).ToUpper())";
              show-top;
            }

          66
            {
                $Menu = "$(($Menu66).ToUpper())";
                startup
            }
          q
            {
              quit-this
            }

          default {"The choice could not be determined."}
      }


}


function ask-continue()
{
  ""
  $Continue = Read-Host -Prompt 'Press enter to return to menu or q to quit ';
  switch ($Continue)
      {
          q
            {
              quit-this
            }

          default
            {
                #Write-Host "`nYou have selected $(($Menu2).ToUpper())`n";

                $Menu=$Menu0
                startup
            }
      }
}

function startup(){
  show-top;
  .\lib\ps1\show-menumain.ps1;
  ask-menumain;
}

function quit-this(){
  Write-Host "Thank you , please come again ...."
  Write-Host ""
}


#------------------------------------------------------------------------------
#Script

startup


$sw.Stop()
$time_elapsed = $sw.Elapsed.TotalSeconds
Write-Host " *** Task completed in "$time_elapsed" seconds. ***"
Log-Action
