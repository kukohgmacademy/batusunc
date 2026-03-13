# Add og:site_name and og:locale after og:image where missing
Get-ChildItem -Path '.' -Filter '*.html' | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    # Only add if not already present
    if ($content -notmatch 'og:site_name' -and $content -match 'og:image') {
        $newContent = $content -replace '(<meta property="og:image"[^>]*>)', "`$1`r`n  <meta property=`"og:site_name`" content=`"Batu Sunrise Camp`">`r`n  <meta property=`"og:locale`" content=`"id_ID`">"
        if ($content -ne $newContent) {
            Set-Content $_.FullName -Value $newContent -NoNewline
            Write-Host "Added og:site_name & og:locale in: $($_.Name)"
        }
    }
}

# Enhance robots meta where it says just "index, follow"
Get-ChildItem -Path '.' -Filter '*.html' | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $newContent = $content -replace '<meta name="robots" content="index, follow">', '<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">'
    if ($content -ne $newContent) {
        Set-Content $_.FullName -Value $newContent -NoNewline
        Write-Host "Enhanced robots meta in: $($_.Name)"
    }
}

Write-Host "OG enhancement complete!"
