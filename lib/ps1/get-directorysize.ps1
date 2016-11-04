
  Get-ChildItem $directory -Recurse | Measure-Object -Sum Length | Select-Object `
  @{Name="  # Files"; Expression={$_.Count}},
  @{Name="Size (Gb)"; Expression={$_.Sum /1024 /1024 / 1024 }} | format-list
