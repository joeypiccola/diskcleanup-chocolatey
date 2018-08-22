
$toolsDir    = Split-Path $MyInvocation.MyCommand.Definition
$version     = [version](Get-WmiObject -Class win32_operatingsystem).version
$version_abr = [string]$version.major + '.' + [string]$version.minor
$exeDest     = 'C:\Windows\System32\'
$muiDest     = 'C:\Windows\System32\en-US\'

switch -regex ($version_abr)
{
  '6.0|6.1' {
    $exe = Join-Path -Path $toolsDir -ChildPath "08\cleanmgr.exe"
    $mui = Join-Path -Path $toolsDir -ChildPath "08\cleanmgr.exe.mui"
  }
  '6.2|6.3|10.0' {
    $exe = Join-Path -Path $toolsDir -ChildPath "12plus\cleanmgr.exe"
    $mui = Join-Path -Path $toolsDir -ChildPath "12plus\cleanmgr.exe.mui"
  }
  Default {
    Write-Error "No disk cleanup version found for `"$version`"."
    break
  }
}

try {
  Copy-Item -Path $exe -Destination $exeDest -Force
} catch {
  Write-Error "Failed to copy `"$exe`" to `"$exeDest`""
}

try {
  Copy-Item -Path $mui -Destination $muiDest -Force
} catch {
  Write-Error "Failed to copy `"$mui`" to `"$muiDest`""
}