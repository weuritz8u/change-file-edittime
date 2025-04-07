# script written by Shadowdara

# Get the folder where the script is executed
$ordner = Get-Location

# Get list of files in the folder
$files = Get-ChildItem -Path $ordner -File

Write-Host "Change File Edit Time by Shadowdara`r`n"

# Check if there are files
if ($files.Count -eq 0) {
    Write-Host "No files found in the folder!"
    exit
}

# Display file list
Write-Host "Available files:"
for ($i = 0; $i -lt $files.Count; $i++) {
    Write-Host "    $($i + 1): $($files[$i].Name)"
}

# Let the user choose a file
$fileIndex = Read-Host "`r`nEnter the number of the file you want to modify"
$fileIndex = [int]$fileIndex - 1

if ($fileIndex -lt 0 -or $fileIndex -ge $files.Count) {
    Write-Host "Invalid selection!"
    exit
}

$selectedFile = $files[$fileIndex]
Write-Host "`r`nSelected file: $($selectedFile.Name)"

# Let the user input a new edit time
$neuesDatum = Read-Host "Enter new date and time (Format: YYYY-MM-DD HH:MM:SS)"
$neuesDatum = [datetime]::ParseExact($neuesDatum, "yyyy-MM-dd HH:mm:ss", $null)

# Change file timestamps
$selectedFile.CreationTime = $neuesDatum
$selectedFile.LastWriteTime = $neuesDatum
Write-Host "Updated: $($selectedFile.Name) -> $neuesDatum"

Write-Host "File update complete!`r`n`r`nClosing!"

Start-Sleep -Seconds 5
