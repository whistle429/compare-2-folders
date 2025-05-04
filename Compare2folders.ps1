# 注意$folder变量不能有中文。folder里面的中文没关系
$folder1 = "路径1"  
$folder2 = "路径2"  

# 获取文件夹1所有文件（不包括文件夹），并添加哈希属性  
$files1 = Get-ChildItem $folder1 -Recurse -File |   
    Select-Object Name, Length,   
        @{Name='RelativePath';Expression={ $_.FullName.Substring($folder1.Length).TrimStart('\') }},  
        @{Name='Hash';Expression={ (Get-FileHash $_.FullName -Algorithm SHA256).Hash }}  

# 获取文件夹2所有文件（不包括文件夹），并添加哈希属性  
$files2 = Get-ChildItem $folder2 -Recurse -File |   
    Select-Object Name, Length,   
        @{Name='RelativePath';Expression={ $_.FullName.Substring($folder2.Length).TrimStart('\') }},  
        @{Name='Hash';Expression={ (Get-FileHash $_.FullName -Algorithm SHA256).Hash }}  

# 按相对路径对比  
$diff = Compare-Object -ReferenceObject $files1 -DifferenceObject $files2 -Property RelativePath, Length, Hash  

if ($diff) {  
    $diff | Format-Table -AutoSize  
} else {  
    Write-Host "Same." -ForegroundColor Green  
}
