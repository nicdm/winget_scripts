# Get the current date
$Date = Get-Date -Format "yyyyMMdd"

# Get the list of installed packages that need upgrading
$Packages = winget upgrade -h

# Convert the list of packages to an array
$PackagesArray = $Packages -split "`n"

# Initialize the progress bar
$TotalPackages = $PackagesArray.Length
for ($i = 0; $i -lt $TotalPackages; $i++) {
    # Update the progress bar
    Write-Progress -Activity "Upgrading packages" -Status "$($i+1) of $TotalPackages" -PercentComplete (($i / $TotalPackages) * 100)

    # Perform the upgrade
    winget upgrade -h --id $PackagesArray[$i] --accept-package-agreements --accept-source-agreements
}

# Output the log to a file
winget upgrade -h --all --accept-package-agreements --accept-source-agreements | Out-File -FilePath "C:\Scripts\wingetLog_$Date.txt"

# Clear the progress bar
Write-Progress -Activity "Upgrading packages" -Completed
