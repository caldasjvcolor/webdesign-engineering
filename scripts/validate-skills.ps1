[CmdletBinding()]
param(
    [string] $Root = (Split-Path -Parent $PSScriptRoot),
    [string] $ValidatorPath = ''
)

$ErrorActionPreference = 'Stop'
$rootPath = [IO.Path]::GetFullPath($Root)
if (-not $ValidatorPath) {
    $codexRoot = [Environment]::GetEnvironmentVariable('CODEX_HOME')
    if (-not $codexRoot) { $codexRoot = Join-Path ([Environment]::GetFolderPath('UserProfile')) '.codex' }
    $ValidatorPath = Join-Path $codexRoot 'skills\.system\skill-creator\scripts\quick_validate.py'
}
if (-not (Test-Path -LiteralPath $ValidatorPath -PathType Leaf)) {
    Write-Output "FAIL skill-creator validator not found: $ValidatorPath"
    exit 2
}
$pythonExecutable = $null
$bundledPython = Join-Path ([Environment]::GetFolderPath('UserProfile')) '.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
if (Test-Path -LiteralPath $bundledPython -PathType Leaf) {
    $pythonExecutable = $bundledPython
}
else {
    $pythonCommand = Get-Command python -ErrorAction SilentlyContinue
    if ($pythonCommand) { $pythonExecutable = $pythonCommand.Source }
}
if (-not $pythonExecutable) {
    Write-Output 'FAIL Python runtime not found; provide the bundled workspace runtime or install Python.'
    exit 2
}
$skillRoot = Join-Path $rootPath 'skills'
if (-not (Test-Path -LiteralPath $skillRoot -PathType Container)) {
    Write-Output "FAIL skills directory not found: $skillRoot"
    exit 2
}
$skills = @(Get-ChildItem -LiteralPath $skillRoot -Directory | Sort-Object Name)
if ($skills.Count -eq 0) { Write-Output 'FAIL no local Skills found'; exit 1 }
$failed = 0
foreach ($skill in $skills) {
    $entry = Join-Path $skill.FullName 'SKILL.md'
    if (-not (Test-Path -LiteralPath $entry -PathType Leaf)) {
        Write-Output "FAIL $($skill.Name): missing SKILL.md"
        $failed++
        continue
    }
    Write-Output "RUN quick_validate $($skill.Name)"
    & $pythonExecutable $ValidatorPath $skill.FullName
    if ($LASTEXITCODE -ne 0) { $failed++ } else { Write-Output "PASS $($skill.Name)" }
}
if ($failed -gt 0) { Write-Output "FAIL skills=$($skills.Count) failed=$failed"; exit 1 }
Write-Output "PASS skills=$($skills.Count) validator=$ValidatorPath"
