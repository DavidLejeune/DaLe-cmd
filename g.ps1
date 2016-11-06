#automation script for handling this git repo



Write-Host '      ____              __        ' -ForegroundColor White
Write-Host '     / __ \   ____ _   / /      ___ ' -ForegroundColor White
Write-Host '    / / / /  / __ `/  / /      / _ \' -ForegroundColor White
Write-Host '   / /_/ /  / /_/ /  / /___   /  __/' -ForegroundColor White
Write-Host '  /_____/   \__,_/  /_____/   \___/ ' -ForegroundColor White
Write-Host '' -ForegroundColor Yellow
Write-Host '    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+' -ForegroundColor Red
Write-Host '    |P|o|w|e|r|s|h|e|l|l| |C|L|I|' -ForegroundColor Red
Write-Host '    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+' -ForegroundColor Red
Write-Host '' -ForegroundColor Yellow
Write-Host '  >> Author : David Lejeune' -ForegroundColor Gray
Write-Host '  >> Created : 06/11/2016' -ForegroundColor Gray
Write-Host ''
write-host " #####################################" -ForegroundColor Magenta
write-host "     Handling local GIT repository     " -ForegroundColor Red
write-host " #####################################" -ForegroundColor Magenta
write-host ""

$Host.UI.RawUI.ForegroundColor = 'darkgreen'
Write-Host "Adding all the (changed) files"
Write-Host ""
git add .

$Host.UI.RawUI.ForegroundColor = 'white'
$message = Read-Host -Prompt 'Enter the commit message ';
$message = [char]34 + $message + [char]34
$Host.UI.RawUI.ForegroundColor = 'yellow'
git commit -m $message

Write-Host ""

$Host.UI.RawUI.ForegroundColor = 'magenta'
Write-Host "Pushing that shit ....."
git push lab master ; git push origin master

Write-Host ""
