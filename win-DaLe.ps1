

#------------------------------------------------------------------------------
#Script Variables
$DC1 = "POLIFORMADL"
$DC2 = "COM"
$Menu = ""
$Menu0 = "Home of the Command Line Cowboy"
$Menu=$Menu0
$Menu1 = "Handle files"
$Menu2 = "Backup"
$Menu99 = "Show description"


#------------------------------------------------------------------------------
#Functions

function Show-Description()
{
  #feeding the narcistic beast
  "# Description"
  "# -----------"
  "# Windows Management tool "
  "# via homebrew powershell enviroment"
  "#"
  "# Author : David Lejeune"
  "# Created : 03/11/2016"
  "#"
  "# Task goals"
  "# ----------"
  "# Managing varying tasks on Windows OS via CLI"
  "# 1)Files handling"
  "#      - cleaning up files to File Hub"
  "#      - Logging and/or deleting big files"
  "# 2)Handle GIT repositories"
  ""
}


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

function show-menumain()
{
  #making this script sexy
    Write-Host " Main Menu :";
    Write-Host "";
    Write-Host '    1. '$Menu1;
    Write-Host '    2. '$Menu2;
    Write-Host '   ';
    Write-Host '    99.'$Menu99;
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
  show-logo;
  show-menuheader;
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
                #Write-Host "`nYou have selected $(($Menu99).ToUpper())`n";
                $Menu = "$(($Menu99).ToUpper())";
                show-top;
                Show-Description;
            }

          default {"The choice could not be determined."}
      }

      $sw.Stop()
      $time_elapsed = $sw.Elapsed.TotalSeconds
      Write-Host " *** Task completed in "$time_elapsed" seconds. ***"
      Log-Action
      ask-continue
}


function ask-continue()
{
  ""
  $Continue = Read-Host -Prompt 'Press enter to return to menu or q to quit ';
  switch ($Continue)
      {
          q
            {
              Write-Host "Thank you , please come again ...."
              Write-Host ""
            }

          default
            {
                Write-Host "`nYou have selected $(($Menu2).ToUpper())`n";
                show-top
                $Menu=$Menu0
                show-menumain
            }
      }
}


#------------------------------------------------------------------------------
#Script

show-top;
show-menumain;
ask-menumain;
