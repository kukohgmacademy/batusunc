# Fix broken JSON-LD (missing comma after priceRange) in all HTML files
Get-ChildItem -Path '.' -Filter '*.html' | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $newContent = $content -replace '"priceRange": "\$"(\s*)"address"', '"priceRange": "$$",$1"address"'
    if ($content -ne $newContent) {
        Set-Content $_.FullName -Value $newContent -NoNewline
        Write-Host "Fixed JSON-LD comma in: $($_.Name)"
    }
}

Write-Host "JSON-LD fix complete!"
