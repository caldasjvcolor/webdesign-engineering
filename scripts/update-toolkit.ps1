[CmdletBinding()]
param(
    [string] $Root = (Split-Path -Parent $PSScriptRoot),
    [switch] $CheckOnly
)

$ErrorActionPreference = 'Stop'
$rootPath = [IO.Path]::GetFullPath($Root)
$manifestPath = Join-Path $rootPath 'toolkit-manifest.json'
if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) { throw "Missing manifest: $manifestPath" }
$manifest = Get-Content -Raw -LiteralPath $manifestPath | ConvertFrom-Json
$today = [DateTimeOffset]::Now
$problems = 0

Write-Output 'REPORT_ONLY no upstream or local files will be overwritten'
foreach ($entry in @($manifest.upstream)) {
    $lastChecked = $null
    try { $lastChecked = [DateTimeOffset]::Parse($entry.last_checked) } catch { $lastChecked = $null }
    $age = if ($lastChecked) { ($today - $lastChecked).Days } else { $null }
    if ($null -eq $age -or $age -gt 30) {
        Write-Output "CHECK_REQUIRED upstream=$($entry.skill) last_checked=$($entry.last_checked)"
    }
    else { Write-Output "CURRENT_CANDIDATE upstream=$($entry.skill) version=$($entry.version) age_days=$age" }
}
foreach ($entry in @($manifest.local_skills)) {
    $skillPath = Join-Path $rootPath (Join-Path 'skills' (Join-Path $entry.skill 'SKILL.md'))
    if (-not (Test-Path -LiteralPath $skillPath -PathType Leaf)) {
        Write-Output "FAIL missing_local_skill=$($entry.skill)"
        $problems++
    }
    else { Write-Output "LOCAL_PRESENT skill=$($entry.skill) version=$($entry.version)" }
}
Write-Output 'REPRODUCE_PATH follow each manifest reproduce_method with its recorded immutable commit; preserve existing installations.'
Write-Output 'UPDATE_PATH follow each manifest update_method: stage a candidate revision, review and validate it, then update the recorded commit only after acceptance. This checker performs neither operation.'
if ($problems -gt 0) { exit 1 }
Write-Output "PASS toolkit_update_check root=$rootPath check_only=$CheckOnly"
