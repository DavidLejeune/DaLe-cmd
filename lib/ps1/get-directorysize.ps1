$StopWatch = [system.diagnostics.stopwatch]::startNew()
  Get-ChildItem $directory -Recurse | Measure-Object -Sum Length | Select-Object `
  @{Name="  # Files"; Expression={$_.Count}},
  @{Name="Size (Gb)"; Expression={$_.Sum /1024 /1024 / 1024 }} | format-list
  write-host "Task completed in $($StopWatch.Elapsed | select TotalSeconds)`n" -ForegroundColor yellow
