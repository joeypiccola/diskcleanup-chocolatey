$exePath = 'C:\Windows\System32\cleanmgr.exe'
$muiPath = 'C:\Windows\System32\en-US\cleanmgr.exe.mui'

try {
  Remove-Item -Path $exePath -Force
} catch {
  Write-Error "Failed to remove `"$exePath`"" -ErrorAction Continue
}

try {
  Remove-Item -Path $muiPath -Force
} catch {
  Write-Error "Failed to remove `"$muiPath`"" -ErrorAction Continue
}