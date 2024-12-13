# update all programs using winget

$Date = Get-Date -Format "yyyyMMdd"

winget upgrade -h --all --accept-package-agreements | Out-File -FilePath "C:\Scripts\Winget\wingetUpdateLog_$Date.txt"

