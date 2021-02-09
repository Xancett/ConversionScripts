$ErrorActionPreference = 'SilentlyContinue'
# Rename all files in the current directory so they aren't too long
dir | Rename-item -NewName {$_.Name -replace ".BluRay.x264.AAC.2.0-LeRalouf", ""}

# File exe
$fileExe = "C:\Program Files\MKVtoolnix\mkvmerge.exe"

# Get all files and pass them through mkv_merge
$files = Get-ChildItem -Filter *.mkv
foreach ($f in $files) {
    Write-Host $f.Name
    $fullName = $f.Name
    $sub = "$($f.BaseName + ".srt")"
    Write-Host "$("Finished\" + $fullName) $fullName $sub"
    & $fileExe -o "$("Finished\" + $fullName)" $fullName $sub
}

<#
# Get all files and pass them through mkv_merge
Get-ChildItem -Path $scriptPath -Filter *.mkv | ForEach-Object {
    $content = Get-Content $_.FullName
    $base = Get-Content $_.BaseName
    $sub = "$($_.BaseName + ".srt")"
    Write-Host $base
    & $fileExe -o "$("Finished\" + $content)" $content $sub
}
#>