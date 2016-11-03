write-host $folder
$colItems = (Get-ChildItem $folder | Measure-Object -property length -sum)
"{0:N2}" -f ($colItems.sum / 1MB) + " MB"
