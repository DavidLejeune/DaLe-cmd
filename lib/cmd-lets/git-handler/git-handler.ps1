
$StopWatch = [system.diagnostics.stopwatch]::startNew()



  $Host.UI.RawUI.ForegroundColor = 'white'
Write-Host "Checking if GIT folder exists"
$GIT=".\file_hub\GIT"
if (Test-Path $GIT)
{
  $Host.UI.RawUI.ForegroundColor = 'gray'
  Write-Host "GIT folder found"
}
Else
{
  $Host.UI.RawUI.ForegroundColor = 'DarkGreen'
  Write-Host "Creating folder ..."
  mkdir $GIT
  if (Test-Path $GIT)
  {
    $Host.UI.RawUI.ForegroundColor = 'white'
    Write-Host "GIT folder created"
  }
  Else
  {
    $Host.UI.RawUI.ForegroundColor = 'red'
    Write-Host "GIT folder not created"
    exit
  }
}






#import data
  $repos = Import-Csv -Delimiter "," -Path ".\lib\cmd-lets\git-handler\git_repos.csv"
  foreach ($repo in $repos)
    {
        #get csv Variables
        $git_name = $repo.git_name
        $git_url = $repo.git_url
        $git_url = "$($drive)$($git_url)"

        $Host.UI.RawUI.ForegroundColor = 'yellow'
        Write-Host ""
        Write-Host "----------------------------------------------------------------"
        Write-Host "Repo name : $($git_name)"
        Write-Host "Repo url  : $($git_url)"
        Write-Host "----------------------------------------------------------------"
        #sleep(2)


        $pwd = pwd;
        $GITpath = "$($GIT)\$($git_name)"
        if (Test-Path $GITpath)
        {
          $Host.UI.RawUI.ForegroundColor = 'white'
          Write-Host "GIT folder exists"
          cd $GITpath
          $Host.UI.RawUI.ForegroundColor = 'blue'
          git pull
        }
        Else
        {
          $Host.UI.RawUI.ForegroundColor = 'red'
          Write-Host "GIT folder doesn't exist >> creating folder"
          cd $GIT
          $Host.UI.RawUI.ForegroundColor = 'magenta'
          git clone $git_url
        }

        cd $pwd
        #$StopWatch.Elapsed
        sleep(0.666)
    }
cd $pwd;
$Host.UI.RawUI.ForegroundColor = 'darkgreen'
write-host "`n`n`nDisplaying all git folders @ $($GIT) :";
write-host "---------------------------------------------";

$Host.UI.RawUI.ForegroundColor = 'cyan'
ls $GIT | select name | format-table;

$Host.UI.RawUI.ForegroundColor = 'magenta'
write-host "Task completed in $($StopWatch.Elapsed | select TotalMinutes)`n"
