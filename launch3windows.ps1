$directories = @(
    "$env:USERPROFILE\Documents",
    "$env:USERPROFILE\Downloads",
	"$env:USERPROFILE\OneDrive - G2 Ops, Inc\Desktop"
)

$shell = New-Object -ComObject Shell.Application

foreach ($path in $directories) {
    if (Test-Path $path) {
        # Open the path. 
        # The '0' flag tells it to use the current window if possible.
        $shell.Open($path)
        # A tiny pause helps Windows process the tab creation
        Start-Sleep -Milliseconds 500 
    } else {
        Write-Warning "Directory not found: $path"
    }
}