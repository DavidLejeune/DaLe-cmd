
$StopWatch = [system.diagnostics.stopwatch]::startNew()



Write-Host "Checking if GIT folder exists"
$GIT=".\file_hub\GIT"
if (Test-Path $GIT)
{
  Write-Host "GIT folder found"
}
Else
{
  Write-Host "Creating folder ..."
  mkdir $GIT
  if (Test-Path $GIT)
  {
    Write-Host "GIT folder created"
  }
  Else
  {
    mkdir $GIT
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
          Write-Host "GIT folder exists"
          cd $GITpath
          git pull
        }
        Else
        {
          Write-Host "GIT folder doesn't exist >> creating folder"
          cd $GIT
          git clone $git_url
        }

        cd $pwd
        #$StopWatch.Elapsed
        sleep(2)
    }
cd $pwd;
write-host "`n`n`nDisplaying all git folders @ $($GIT) :";
write-host "---------------------------------------------`n";
ls $GIT;

write-host "`nTask completed in $($StopWatch.Elapsed | select TotalMinutes)"
