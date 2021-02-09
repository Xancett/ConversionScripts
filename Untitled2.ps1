<#
$test = "My name is Bob, her name is Sara."
[regex]$pattern = "name"
$pattern.replace($test, "baby", 1) 
#>
<#
$fileName = "Supernatural.S01E08.The.Benders.mkv"
[regex]$pattern = "\."
$replace = " - "
$newName = $pattern.Replace($fileName, " - ", 2)
$fileName = $newName
$newName = $pattern.Replace($fileName, " ")
$newName
#>

$files = Get-ChildItem -Filter *.mkv
foreach ($f in $files) {
    $baseName = $f.BaseName
    $fullName = $f.Name
    [regex]$pattern = "\."
    $newName = $pattern.Replace($baseName, " - ", 2)
    $baseName = $newName
    $newName = $pattern.Replace($baseName, " ")
    $newName = "$($newName + ".mkv")"
    Write-Host $newName
    Rename-item $f $newName
}