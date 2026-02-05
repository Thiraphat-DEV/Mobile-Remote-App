# ล้างโฟลเดอร์ build เมื่อ Flutter แจ้ง "failed to delete build\flutter_assets"
# รันจากโฟลเดอร์โปรเจกต์: .\scripts\clean-build.ps1

$projectRoot = Split-Path -Parent $PSScriptRoot
if (-not (Test-Path (Join-Path $projectRoot "pubspec.yaml"))) {
    $projectRoot = Get-Location
}

Set-Location $projectRoot
Write-Host "ปิด Edge หรือแท็บที่รันแอป Flutter ก่อน แล้วกด Enter..." -ForegroundColor Yellow
Read-Host

Write-Host "กำลังลบโฟลเดอร์ build..." -ForegroundColor Cyan
Remove-Item -Path "build" -Recurse -Force -ErrorAction SilentlyContinue
if (Test-Path "build") {
    Write-Host "ลบไม่หมด - ลองรัน PowerShell แบบ Run as Administrator" -ForegroundColor Red
    exit 1
}
Write-Host "ลบ build เรียบร้อย" -ForegroundColor Green

flutter clean
flutter pub get
Write-Host "เสร็จแล้ว รัน: flutter run -d edge" -ForegroundColor Green
