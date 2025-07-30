# install-apps.ps1

# Path to the app list
$appListPath = "apps.txt"

# Check if file exists
if (-Not (Test-Path $appListPath)) {
    Write-Error "App list file '$appListPath' not found!"
    exit 1
}

# Read the file line by line
$apps = Get-Content $appListPath | Where-Object { $_ -and $_ -notmatch '^#' }

foreach ($app in $apps) {
    Write-Host "Installing: $app" -ForegroundColor Cyan
    winget install --id "$app" --accept-source-agreements --accept-package-agreements --silent
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Failed to install $app"
    } else {
        Write-Host "$app installed successfully." -ForegroundColor Green
    }
}
