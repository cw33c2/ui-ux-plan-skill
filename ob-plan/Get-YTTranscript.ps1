param([string]$Url, [string]$OutFile = "Transcript.md")

if (-not $Url) { Write-Host "請提供影片網址！例如: .\Get-YTTranscript.ps1 -Url 'https://youtu.be/...'" -ForegroundColor Red; exit }
if (-not (Test-Path "yt-dlp.exe")) { curl.exe -L -o yt-dlp.exe https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe }

Write-Host "正在獲取字幕..." -ForegroundColor Cyan
.\yt-dlp.exe --write-auto-subs --write-subs --sub-langs "zh.*" --skip-download $Url -o "temp_sub" | Out-Null

$vttFile = Get-ChildItem -Filter "temp_sub*.vtt" | Where-Object { $_.Name -match "zh" } | Select-Object -First 1

if (-not $vttFile) {
    Write-Host "=========================================" -ForegroundColor Yellow
    Write-Host "⚠️ 提醒您：此影片完全沒有中文字幕！" -ForegroundColor Yellow
    Write-Host "已取消處理，不執行後續動作。" -ForegroundColor Yellow
    Write-Host "=========================================" -ForegroundColor Yellow
    Remove-Item "temp_sub*.vtt" -Force -ErrorAction SilentlyContinue
    exit
}

$content = [System.IO.File]::ReadAllText($vttFile.FullName, [System.Text.Encoding]::UTF8)
$cleaned = @()
foreach ($line in ($content -split "`r?`n")) {
    if ($line -match "^WEBVTT|^Kind:|^Language:|^\d{2}:\d{2}:\d{2}" -or [string]::IsNullOrWhiteSpace($line)) { continue }
    $cleaned += ($line -replace "<[^>]+>", "").Trim()
}

$final = @()
$prev = ""
foreach ($line in $cleaned) { if ($line -ne $prev) { $final += $line; $prev = $line } }

[System.IO.File]::WriteAllText($OutFile, ($final -join " "), [System.Text.Encoding]::UTF8)
Remove-Item "temp_sub*.vtt" -Force -ErrorAction SilentlyContinue
Write-Host "✅ 中文字幕已擷取至 $OutFile ，可交由 OB-plan 工作流處理。" -ForegroundColor Green
