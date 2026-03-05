<#
.SYNOPSIS
    Restores the Windows 10 "Ribbon" File Explorer interface on Windows 11.
    
.DESCRIPTION
    This script utilizes a legacy navigation bug in the Windows Control Panel 
    to summon a File Explorer window using the Windows 10 UI elements.
    It dynamically locates the user's OneDrive Documents folder.

.NOTES
    Author: Your GitHub Name
    License: MIT
#>

# 1. Dynamically find the Documents folder (handles OneDrive or Local automatically)
$targetPath = [Environment]::GetFolderPath("MyDocuments")

try {
    Write-Host "Initializing Legacy Explorer Shell..." -ForegroundColor Cyan

    # 2. Launch Control Panel in a minimized state to reduce visual flicker
    $cpProcess = Start-Process "control.exe" -WindowStyle Minimized -PassThru
    
    # 3. Wait for the shell to register the new window
    # Increase this value (e.g., to 1200) if the script fails on slower hardware
    Start-Sleep -Milliseconds 1000

    # 4. Access the Windows Shell COM Object
    $shellApp = New-Object -ComObject Shell.Application
    
    # 5. Find the specific "Control Panel" window handle
    # We use -match to account for different system languages or "All Control Panel Items"
    $window = $shellApp.Windows() | Where-Object { $_.LocationName -match "Control" -or $_.Name -match "Control" }

    if ($window) {
        # 6. Redirect the legacy window to your Documents path
        $window.Navigate($targetPath)
        Write-Host "Success: Classic UI restored at $targetPath" -ForegroundColor Green
    } else {
        Write-Warning "Could not capture the Control Panel window. Try increasing the Sleep timer."
    }
}
catch {
    Write-Host "An unexpected error occurred: $($_.Exception.Message)" -ForegroundColor Red
}
finally {
    # Optional: Brief pause if running manually to see status
    # Start-Sleep -Seconds 1
}