Get-WmiObject Win32_DiskDrive | % {
  $disk = $_
  $partitions = "ASSOCIATORS OF " +
                "{Win32_DiskDrive.DeviceID='$($disk.DeviceID)'} " +
                "WHERE AssocClass = Win32_DiskDriveToDiskPartition"
  Get-WmiObject -Query $partitions | % {
    $partition = $_
    $drives = "ASSOCIATORS OF " +
              "{Win32_DiskPartition.DeviceID='$($partition.DeviceID)'} " +
              "WHERE AssocClass = Win32_LogicalDiskToPartition"
    Get-WmiObject -Query $drives | % {
      New-Object -Type PSCustomObject -Property @{
        #DiskSize    = $disk.Size
        DriveLetter = $_.DeviceID
        DiskModel   = $disk.Model
        Partition   = $partition.Name
        RawSize     = ($partition.Size / 1024 / 1024 / 1024)
        VolumeName  = $_.VolumeName
        FreeSpace   = ($_.FreeSpace / 1024 / 1024 / 1024)
        FreePercentage = ( ($_.FreeSpace / 1024 / 1024 / 1024)/ ($partition.Size / 1024 / 1024 / 1024)) * 100

        #Disk        = $disk.DeviceID
        #DiskSize    = $disk.Size
        #DiskModel   = $disk.Model
        #Partition   = $partition.Name
        #RawSize     = $partition.Size
        #DriveLetter = $_.DeviceID
        #VolumeName  = $_.VolumeName
        #Size        = $_.Size
        #FreeSpace   = $_.FreeSpace

      } | Select DriveLetter , VolumeName , DiskModel, Partition , FreeSpace , RawSize , FreePercentage | format-table 
    }

  }
}
