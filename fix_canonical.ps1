# Fix canonical URLs for each page
$canonicalFixes = @{
    'camping.html' = 'camping.html'
    'camping-keluarga-di-batu-sunrise-camp.html' = 'camping-keluarga-di-batu-sunrise-camp.html'
    'healing-estetik-di-batu.html' = 'healing-estetik-di-batu.html'
    'mentahan.html' = 'mentahan.html'
    'paket-sunrise1.html' = 'paket-sunrise1.html'
    'paket-sunrise2.html' = 'paket-sunrise2.html'
    'paket-sunrise3.html' = 'paket-sunrise3.html'
    'panduan-camping-untuk-pemula.html' = 'panduan-camping-untuk-pemula.html'
    'ground-camping-vs-glamping-batu.html' = 'ground-camping-vs-glamping-batu.html'
    'panduan-lengkap-ground-camping-kota-batu.html' = 'panduan-lengkap-ground-camping-kota-batu.html'
    'panduan-wisata-hits-kota-batu.html' = 'panduan-wisata-hits-kota-batu.html'
    'paket-detail.html' = 'paket-detail.html'
}

foreach ($file in $canonicalFixes.Keys) {
    $filePath = Join-Path '.' $file
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw
        $correctCanonical = "https://batusunrisecamp.com/$($canonicalFixes[$file])"
        # Replace wrong canonical
        $newContent = $content -replace 'href="https://batusunrisecamp.com/galeri.html"', "href=`"$correctCanonical`""
        if ($content -ne $newContent) {
            Set-Content $filePath -Value $newContent -NoNewline
            Write-Host "Fixed canonical in: $file -> $correctCanonical"
        }
    }
}

# Fix OG image across all files - use actual existing image
Get-ChildItem -Path '.' -Filter '*.html' | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $newContent = $content -replace 'assets/img/og-image\.jpg', 'assets/img/Logo Batu Sunrise Camp.webp'
    if ($content -ne $newContent) {
        Set-Content $_.FullName -Value $newContent -NoNewline
        Write-Host "Fixed OG image in: $($_.Name)"
    }
}

Write-Host "Canonical & OG image fix complete!"
