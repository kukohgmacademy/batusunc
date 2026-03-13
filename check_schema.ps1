$files = Get-ChildItem -Filter *.html
foreach ($f in $files) {
    Write-Host "File: $($f.Name)"
    $content = Get-Content $f.FullName -Raw
    if ($content -match '(?s)<script type="application/ld\+json">(.*?)</script>') {
        Write-Host "Found Schema"
        if ($matches[1] -match '"@type":\s*"Article"') { Write-Host "- Type: Article" }
        if ($matches[1] -match '"@type":\s*"LocalBusiness"') { Write-Host "- Type: LocalBusiness" }
        if ($matches[1] -match '"priceRange":\s*"\$"') { Write-Host "- PriceRange: $" }
        if ($matches[1] -match '"priceRange":\s*"\$\$"') { Write-Host "- PriceRange: " }
    } else {
        Write-Host "NO Schema Found"
    }
    Write-Host "---"
}
