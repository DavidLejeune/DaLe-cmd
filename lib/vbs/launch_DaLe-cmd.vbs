Set objShell = CreateObject("Wscript.shell")

objShell.run("powershell")
Wscript.sleep (2000)
objShell.SendKeys "cd L:\DaLe\System\DaLe-cmd"
objShell.SendKeys "{ENTER}"
objShell.SendKeys ".\win-DaLe.ps1"
objShell.SendKeys "{ENTER}"
