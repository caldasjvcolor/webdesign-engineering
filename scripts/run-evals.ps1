[CmdletBinding()]
param([string] $Root = (Split-Path -Parent $PSScriptRoot))

$ErrorActionPreference = 'Stop'
$rootPath = [IO.Path]::GetFullPath($Root)
$casesPath = Join-Path $rootPath 'evals\cases'
$required = @('id', 'category', 'input', 'expected_behaviors', 'forbidden_behaviors', 'objective_checks')
$categories = @('architecture', 'frontend', 'seo', 'structured-data', 'forms', 'quality')
if (-not (Test-Path -LiteralPath $casesPath -PathType Container)) { throw "Missing eval cases: $casesPath" }
$cases = @(Get-ChildItem -LiteralPath $casesPath -Filter '*.json' -File | Where-Object { $_.Name -notlike 'EVAL_*.json' } | Sort-Object Name)
if ($cases.Count -eq 0) { throw 'No eval cases found' }
$seen = @{}
$seenCategories = @{}
foreach ($file in $cases) {
    $case = Get-Content -Raw -LiteralPath $file.FullName | ConvertFrom-Json
    foreach ($field in $required) {
        if ($case.PSObject.Properties.Name -notcontains $field) { throw "$($file.Name) missing field: $field" }
    }
    if ($seen.ContainsKey($case.id)) { throw "Duplicate eval id: $($case.id)" }
    if ($case.category -notin $categories) { throw "Unsupported category: $($case.category)" }
    if (@($case.expected_behaviors).Count -eq 0 -or @($case.forbidden_behaviors).Count -eq 0 -or @($case.objective_checks).Count -eq 0) { throw "$($case.id) has an empty behavior/check list" }
    $seen[$case.id] = $true
    $seenCategories[$case.category] = $true
    Write-Output "PASS $($case.id) category=$($case.category)"
}
foreach ($category in $categories) {
    if (-not $seenCategories.ContainsKey($category)) { throw "Missing required eval category: $category" }
}
Write-Output "PASS evals=$($cases.Count) categories=$($seenCategories.Count) mode=FIXTURE_SCHEMA_ONLY"
