# 서울 강남구 날씨·미세먼지를 가져와 weather.txt에 저장 (덮어쓰기)
# 데이터: Open-Meteo (API 키 불필요) — https://open-meteo.com

$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$lat = 37.5172
$lon = 127.0473
$outFile = Join-Path (Split-Path $PSScriptRoot -Parent) 'weather.txt'

$weatherUrl = "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon" +
    "&current=temperature_2m,apparent_temperature,relative_humidity_2m,weather_code,wind_speed_10m" +
    "&daily=temperature_2m_max,temperature_2m_min,precipitation_probability_max" +
    "&timezone=Asia%2FSeoul&forecast_days=1"
$airUrl = "https://air-quality-api.open-meteo.com/v1/air-quality?latitude=$lat&longitude=$lon" +
    "&current=pm10,pm2_5&timezone=Asia%2FSeoul"

# WMO 날씨 코드 → 한글
function Get-WeatherText([int]$code) {
    switch ($code) {
        0                    { '맑음' }
        { $_ -in 1, 2 }      { '구름 조금' }
        3                    { '흐림' }
        { $_ -in 45, 48 }    { '안개' }
        { $_ -in 51..57 }    { '이슬비' }
        { $_ -in 61..67 }    { '비' }
        { $_ -in 71..77 }    { '눈' }
        { $_ -in 80..82 }    { '소나기' }
        { $_ -in 85, 86 }    { '눈 소나기' }
        { $_ -in 95..99 }    { '뇌우' }
        default              { "알 수 없음($code)" }
    }
}

# 환경부 미세먼지 예보 등급 기준
function Get-DustGrade([double]$value, [double[]]$limits) {
    if ($value -le $limits[0]) { '좋음' }
    elseif ($value -le $limits[1]) { '보통' }
    elseif ($value -le $limits[2]) { '나쁨' }
    else { '매우나쁨' }
}

try {
    $w = Invoke-RestMethod -Uri $weatherUrl -TimeoutSec 30
    $a = Invoke-RestMethod -Uri $airUrl -TimeoutSec 30
} catch {
    # 실패하면 기존 weather.txt를 건드리지 않음
    Write-Error "날씨 정보를 가져오지 못했습니다: $($_.Exception.Message)"
    exit 1
}

$c = $w.current
$d = $w.daily
$now = Get-Date
$days = '일', '월', '화', '수', '목', '금', '토'
$stamp = $now.ToString('yyyy-MM-dd') + " ($($days[[int]$now.DayOfWeek])) " + $now.ToString('HH:mm')

$pm10 = [double]$a.current.pm10
$pm25 = [double]$a.current.pm2_5

$text = @"
==== $stamp · 서울 강남구 ====
날씨      : $(Get-WeatherText $c.weather_code)
기온      : $($c.temperature_2m)℃ (체감 $($c.apparent_temperature)℃)
최저/최고 : $($d.temperature_2m_min[0])℃ / $($d.temperature_2m_max[0])℃
강수확률  : $($d.precipitation_probability_max[0])%
습도/바람 : $($c.relative_humidity_2m)% / $($c.wind_speed_10m) km/h
미세먼지  : PM10 $pm10㎍/㎥ ($(Get-DustGrade $pm10 @(30, 80, 150)))
초미세먼지: PM2.5 $pm25㎍/㎥ ($(Get-DustGrade $pm25 @(15, 35, 75)))

※ 출처: Open-Meteo (모델 추정값, 측정소 실측과 다를 수 있음)
"@

Set-Content -Path $outFile -Value $text -Encoding UTF8
Write-Output "저장 완료: $outFile"
