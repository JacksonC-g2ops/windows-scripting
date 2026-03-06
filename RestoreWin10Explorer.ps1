# Restore Windows 10 style File Explorer and classic context menu

Write-Host "Applying Windows 10 File Explorer interface..."

# Enable Windows 10 ribbon UI
$explorerKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

Set-ItemProperty -Path $explorerKey -Name "UseCompactMode" -Value 0 -ErrorAction SilentlyContinue

# Enable classic context menu
$contextMenuKey = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"

if (!(Test-Path $contextMenuKey)) {
    New-Item -Path $contextMenuKey -Force | Out-Null
}

if (!(Test-Path "$contextMenuKey\InprocServer32")) {
    New-Item -Path "$contextMenuKey\InprocServer32" -Force | Out-Null
}

Set-ItemProperty -Path "$contextMenuKey\InprocServer32" -Name "(Default)" -Value ""

Write-Host "Registry keys applied."

# Restart Explorer
Write-Host "Restarting File Explorer..."

Stop-Process -Name explorer -Force
Start-Process explorer

Write-Host "Windows 10 style Explorer restored."