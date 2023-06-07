# Counts the amount of large files in a given directory and displays the results

# Declare a path to search for large files
$path = Read-Host -Prompt 'Please enter the file path you want to scan for large files'

# Scan the path and store data in the $rawFileData variable
$rawFileData = Get-ChildItem -Path $path -Recurse

# Sort $rawFileData to only objects greater than specified size
$largeFiles = $rawFileData | Where-Object {$_.Length -gt 1MB}

# Measure the objects in $largeFiles and store the count in the variable $largeFilesCount
$largeFilesCount = $largeFiles | Measure-Object | Select-Object -ExpandProperty Count

# Display the amount of large files in the given path to the user
Write-Host "You have $largeFilesCount large file(s) in $path"
