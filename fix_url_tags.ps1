$pages = @(
    'about.html',
    'blog.html',
    'camping-keluarga-di-batu-sunrise-camp.html',
    'camping.html',
    'galeri.html',
    'ground-camping-vs-glamping-batu.html',
    'healing-estetik-di-batu.html',
    'index.html',
    'layanan.html',
    'paket-detail.html',
    'paket-sunrise1.html',
    'paket-sunrise2.html',
    'paket-sunrise3.html',
    'paket.html',
    'panduan-camping-untuk-pemula.html',
    'panduan-lengkap-ground-camping-kota-batu.html',
    'panduan-wisata-hits-kota-batu.html'
)

foreach ($file in $pages) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        
        $urlEndpoint = if ($file -eq 'index.html') { '' } else { $file }
        $correctUrl = "https://batusunrisecamp.com/$urlEndpoint"

        # Regex replace og:url
        $newContent = $content -replace '(?s)<meta property="og:url" content="[^"]*">', "<meta property=`"og:url`" content=`"$correctUrl`">"
        
        # Regex replace twitter:url
        $newContent = $newContent -replace '(?s)<meta property="twitter:url" content="[^"]*">', "<meta property=`"twitter:url`" content=`"$correctUrl`">"

        if ($content -ne $newContent) {
            Set-Content $file -Value $newContent -NoNewline
            Write-Host "Fixed og/twitter url in: $file -> $correctUrl"
        }
    }
}
Write-Host "URL tags fix complete!"
