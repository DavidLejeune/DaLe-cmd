$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')

#------------------------------------------------------------------------------
#Script Variables


$Menu = ""
$Menu0 = "Home of the Command Line Cowboy"
$Menu=$Menu0

$Menu1 = "Handle files"
  $Menu11 = "Cleanup files to File Hub"
    $Menu111 = "Do cleanup"
    $Menu112 = "Show cleanup & startup folder(s)"
  $Menu12 = "Log/Cleanup big files"

$Menu2 = "Backup"
  $Menu21 = "Start Backup"
  $Menu22 = "View Backup variables"
  $Menu23 = "Edit Backup variables"

$Menu3 = "Handle GIT repositories"
  $Menu31 = "Backup GIT repositories"
  $Menu32 = "View GIT repositories"
  $Menu33 = "Edit GIT repositories"

$Menu4 = "Get info"
  $Menu41 = "List drive info"
  $Menu42 = "Show antivirus and firewall status"
  $Menu43 = "Get directory size"

$Menu5 = "Tools"
  $Menu51 = "Shutdown system Now"
  $Menu52 = "Restart system Now"
  $Menu53 = "Eject media"

$Menu66 = "Back to main menu"
$Menu99 = "Show description"





#------------------------------------------------------------------------------
#Script

.\lib\ps1\startup.ps1
