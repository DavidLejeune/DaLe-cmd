$driveEject = New-Object -comObject Shell.Application
$driveEject.Namespace(17).ParseName($drive).InvokeVerb("Eject")
