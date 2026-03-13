$seoData = @{
    'camping-keluarga-di-batu-sunrise-camp.html' = @{
        title = 'Camping Keluarga di Batu Sunrise Camp | Ramah Anak & Lengkap'
        desc = 'Rencanakan liburan camping keluarga seru di Batu Sunrise Camp. Fasilitas lengkap, aman untuk anak, dan pemandangan luar biasa.'
        keywords = 'camping keluarga Batu, kemah anak Batu, wisata keluarga Batu, glamping keluarga Malang'
    }
    'healing-estetik-di-batu.html' = @{
        title = 'Healing Estetik di Batu: Sunrise & City Lights Murah'
        desc = 'Temukan tempat healing estetik dan murah di Batu. Nikmati view sunrise dan gemerlap city light tanpa menguras kantong.'
        keywords = 'healing estetik Batu, sunrise Batu murah, wisata alam Batu, tempat healing Malang'
    }
    'panduan-camping-untuk-pemula.html' = @{
        title = 'Panduan Lengkap Camping untuk Pemula di Batu Sunrise Camp'
        desc = 'Tips jitu dan panduan lengkap merencanakan kemah pertama di Batu Sunrise Camp untuk pemula. Aman, mudah, dan bebas ribet.'
        keywords = 'panduan camping pemula, tips kemah, cara camping Batu, sewa tenda Batu'
    }
    'paket-sunrise1.html' = @{
        title = 'Paket Sunrise 1 - Batu Sunrise Camp | Sewa Lahan Termurah'
        desc = 'Paket Sunrise 1: sewa lahan luas untuk tenda mandiri dengan harga paling hemat mulai dari Rp 50.000, lengkap akses listrik.'
        keywords = 'paket sunrise 1, tiket camping Batu, lahan camping Batu, kemah murah Batu'
    }
    'paket-sunrise2.html' = @{
        title = 'Paket Sunrise 2 - Batu Sunrise Camp | Tenda Siap Pakai'
        desc = 'Paket Sunrise 2: tenda siap pakai lengkap dengan matras dan sleeping bag untuk 2-4 orang. Liburan nyaman anti repot.'
        keywords = 'paket sunrise 2, sewa tenda Batu, glamping murah Batu, paket kemah lengkap'
    }
    'paket-sunrise3.html' = @{
        title = 'Paket Sunrise 3 - Batu Sunrise Camp | Fasilitas Premium'
        desc = 'Paket Sunrise 3: fasilitas camping super komplit (tenda, alat masak, meja, kursi) untuk kenyamanan maksimal saat menginap.'
        keywords = 'paket sunrise 3, glamping mewah Batu, paket kemah premium, perlengkapan masak camping'
    }
}

foreach ($file in $seoData.Keys) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        $data = $seoData[$file]

        # Regex replace Title
        $content = $content -replace '(?s)<title>.*?</title>', "<title>$($data.title)</title>"
        
        # Regex replace Description
        $content = $content -replace '(?s)<meta name="description"`s*content="[^"]*">', "<meta name=`"description`"`n    content=`"$($data.desc)`">"
        
        # Regex replace Keywords
        $content = $content -replace '(?s)<meta name="keywords" content="[^"]*">', "<meta name=`"keywords`" content=`"$($data.keywords)`">"
        
        # Regex replace OG Title
        $content = $content -replace '(?s)<meta property="og:title" content="[^"]*">', "<meta property=`"og:title`" content=`"$($data.title)`">"
        
        # Regex replace OG Description
        $content = $content -replace '(?s)<meta property="og:description" content="[^"]*">', "<meta property=`"og:description`" content=`"$($data.desc)`">"

        # Regex replace Twitter Title
        $content = $content -replace '(?s)<meta property="twitter:title" content="[^"]*">', "<meta property=`"twitter:title`" content=`"$($data.title)`">"
        
        # Regex replace Twitter Description
        $content = $content -replace '(?s)<meta property="twitter:description" content="[^"]*">', "<meta property=`"twitter:description`" content=`"$($data.desc)`">"

        Set-Content $file -Value $content -NoNewline
        Write-Host "Updated SEO Tags for: $file"
    }
}
Write-Host "Done!"
