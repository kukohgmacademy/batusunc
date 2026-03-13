Get-ChildItem -Path '.' -Filter '*.html' | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $newContent = $content -replace '6281234567890', '6281239225692'
    if ($content -ne $newContent) {
        Set-Content $_.FullName -Value $newContent -NoNewline
        Write-Host "Updated WA number in: $($_.Name)"
    }
}

# Fix html lang from en to id
Get-ChildItem -Path '.' -Filter '*.html' | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $newContent = $content -replace '<html lang="en">', '<html lang="id">'
    if ($content -ne $newContent) {
        Set-Content $_.FullName -Value $newContent -NoNewline
        Write-Host "Fixed lang attribute in: $($_.Name)"
    }
}

Write-Host "Done!"
