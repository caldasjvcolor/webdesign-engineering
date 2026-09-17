[CmdletBinding()]
param(
    [string] $Root = (Get-Location).Path,
    [switch] $RunChecks
)

$ErrorActionPreference = 'Stop'
$rootPath = [IO.Path]::GetFullPath($Root)
$packagePath = Join-Path $rootPath 'package.json'
$errors = [Collections.Generic.List[string]]::new()
$warnings = [Collections.Generic.List[string]]::new()

if (-not (Test-Path -LiteralPath $packagePath -PathType Leaf)) {
    Write-Output "FAIL missing package.json: $packagePath"
    exit 2
}

try {
    $package = Get-Content -Raw -LiteralPath $packagePath | ConvertFrom-Json
}
catch {
    Write-Output "FAIL invalid package.json: $($_.Exception.Message)"
    exit 1
}

$routeCandidates = @(
    (Join-Path $rootPath 'app\page.tsx'),
    (Join-Path $rootPath 'app\page.jsx'),
    (Join-Path $rootPath 'src\app\page.tsx'),
    (Join-Path $rootPath 'src\app\page.jsx')
)
if (-not ($routeCandidates | Where-Object { Test-Path -LiteralPath $_ -PathType Leaf })) {
    $errors.Add('No App Router page found at app/page.* or src/app/page.*')
}

$scriptNames = @()
if ($package.PSObject.Properties.Name -contains 'scripts' -and $null -ne $package.scripts) {
    $scriptNames = @($package.scripts.PSObject.Properties.Name)
}
if ($scriptNames -notcontains 'build') { $errors.Add('package.json has no build script') }
foreach ($optional in @('typecheck', 'lint', 'test')) {
    if ($scriptNames -notcontains $optional) { $warnings.Add("package.json has no $optional script") }
}

$runner = 'npm'
if (Test-Path -LiteralPath (Join-Path $rootPath 'pnpm-lock.yaml')) { $runner = 'pnpm' }
elseif (Test-Path -LiteralPath (Join-Path $rootPath 'yarn.lock')) { $runner = 'yarn' }
elseif (Test-Path -LiteralPath (Join-Path $rootPath 'bun.lockb')) { $runner = 'bun' }

if ($RunChecks) {
    foreach ($check in @('typecheck', 'lint', 'test', 'build')) {
        if ($scriptNames -contains $check) {
            Write-Output "RUN $runner run $check"
            Push-Location $rootPath
            try { & $runner run $check; $code = $LASTEXITCODE }
            finally { Pop-Location }
            if ($code -ne 0) { $errors.Add("$runner run $check exited with $code") }
        }
        else { Write-Output "NOT_RUN $check (script not configured)" }
    }
}

foreach ($warning in $warnings) { Write-Output "WARN $warning" }
foreach ($error in $errors) { Write-Output "FAIL $error" }
if ($errors.Count -gt 0) { exit 1 }
Write-Output "PASS web_preflight root=$rootPath runner=$runner run_checks=$RunChecks"
exit 0
