$FreeSpace = (Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -ExpandProperty FreeSpace)[0]
$TotalSpace = (Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -ExpandProperty Size)[0]$os = Get-CimInstance -ClassName win32_operatingsystem -Property TotalVisibleMemorySize, FreePhysicalMemory

$FreeSpaceRounded = [Math]::Round($FreeSpace / 1GB)
$TotalSpaceRounded = [Math]::Round($TotalSpace / 1GB)
$TotalRam = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum / 1GB


$PrecentFree = "{0:p}" -f ($FreeSpaceRounded / $TotalSpaceRounded)
$memUsage = "{0:p}" -f (($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.totalVisibleMemorySize)

Clear-Host
Write-Output "
$PrecentFree Space Remaining
You have a total of $FreeSpaceRounded GB Left to use
Out of a total of $TotalSpaceRounded GB

$memUsage out of a total of $TotalRam GB Memory used
"