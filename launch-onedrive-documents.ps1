$targetPath = [Environment]::GetFolderPath("MyDocuments")

$shell = New-Object -ComObject Shell.Application

if(Test-Path $targetPath){
$shell.Open($targetPath)	
} else {
	Write-Host "Target path not found."
}
