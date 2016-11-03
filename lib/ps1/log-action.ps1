$Date = Get-Date
$Entry = $Date.ToString() + "," + $env:username.ToString() + "," + $Menu.ToString() + ","+ $time_elapsed + ","
Add-Content .\log\script_logbook.csv $Entry
