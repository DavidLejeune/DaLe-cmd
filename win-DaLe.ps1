

#------------------------------------------------------------------------------
#Script Variables
$DC1 = "POLIFORMADL"
$DC2 = "COM"

$Menu = ""
$Menu0 = "Home of the Command Line Cowboy"
$Menu=$Menu0

$Menu1 = "Handle files"
$Menu11 = "Cleanup files to File Hub"
$Menu12 = "Log/Cleanup big files"

$Menu2 = "Backup"
$Menu21 = "Start Backup"

$Menu66 = "Back to main menu"
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
    Write-Host " Menu GIT :";
    Write-Host "";
    Write-Host '    1. '$Menu21;
    Write-Host '    2. '$Menu22;
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
            
          q
            {
              quit-this
            }

          99
            {
                #Write-Host "`nYou have selected $(($Menu99).ToUpper())`n";
                $Menu = "$(($Menu99).ToUpper())";
                show-top;
                Show-Description;
                ask-continue;
            }

          default {"The choice could not be determined."}
      }

      $sw.Stop()
      $time_elapsed = $sw.Elapsed.TotalSeconds
      Write-Host " *** Task completed in "$time_elapsed" seconds. ***"
      Log-Action
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
                show-top;
                show-menumain;
                ask-menumain;
            }
          q
            {
              quit-this
            }

          default {"The choice could not be determined."}
      }

      $sw.Stop()
      $time_elapsed = $sw.Elapsed.TotalSeconds
      Write-Host " *** Task completed in "$time_elapsed" seconds. ***"
      Log-Action
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
                show-top
                $Menu=$Menu0
                show-menumain
                ask-menumain
            }
      }
}

function startup(){
  show-top;
  show-menumain;
  ask-menumain;
}

function quit-this(){
  Write-Host "Thank you , please come again ...."
  Write-Host ""
}


#------------------------------------------------------------------------------
#Script

show-top;
show-menumain;
ask-menumain;
