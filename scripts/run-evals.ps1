[CmdletBinding()]
param(
    [string] $Root = (Split-Path -Parent $PSScriptRoot),
    [string[]] $CaseId = @()
)

$ErrorActionPreference = 'Stop'
$rootPath = [IO.Path]::GetFullPath($Root)
$casesPath = Join-Path $rootPath 'evals\cases'
$required = @('id', 'category', 'input', 'expected_behaviors', 'forbidden_behaviors', 'objective_checks')
$categories = @('architecture', 'frontend', 'seo', 'structured-data', 'forms', 'quality', 'debugging', 'context')
if (-not (Test-Path -LiteralPath $casesPath -PathType Container)) { throw "Missing eval cases: $casesPath" }
$cases = @(Get-ChildItem -LiteralPath $casesPath -Filter '*.json' -File | Where-Object { $_.Name -notlike 'EVAL_*.json' } | Sort-Object Name)
if ($CaseId.Count -gt 0) {
    $cases = @($cases | Where-Object {
        $candidate = Get-Content -Raw -LiteralPath $_.FullName | ConvertFrom-Json
        $CaseId -contains $candidate.id
    })
    if ($cases.Count -ne $CaseId.Count) { throw "One or more requested eval ids were not found: $($CaseId -join ', ')" }
}
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
    if ($case.category -eq 'debugging') {
        $requiredScenarios = @('A', 'B', 'C', 'D', 'E', 'F', 'G')
        $scenarios = @($case.scenarios)
        if ($scenarios.Count -ne $requiredScenarios.Count) { throw "$($case.id) must contain the seven required scenarios" }
        $scenarioIds = @($scenarios | ForEach-Object { $_.id })
        foreach ($scenarioId in $requiredScenarios) {
            if ($scenarioId -notin $scenarioIds) { throw "$($case.id) missing debugging scenario: $scenarioId" }
        }
        foreach ($scenario in $scenarios) {
            foreach ($field in @('input', 'expected_behaviors', 'forbidden_behaviors', 'objective_checks')) {
                if ($scenario.PSObject.Properties.Name -notcontains $field -or @($scenario.$field).Count -eq 0) {
                    throw "$($case.id) scenario $($scenario.id) missing or empty: $field"
                }
            }
        }
    }
    $seen[$case.id] = $true
    $seenCategories[$case.category] = $true
    Write-Output "PASS $($case.id) category=$($case.category)"
}
if ($CaseId.Count -eq 0) {
    foreach ($category in $categories) {
        if (-not $seenCategories.ContainsKey($category)) { throw "Missing required eval category: $category" }
    }
}
Write-Output "PASS evals=$($cases.Count) categories=$($seenCategories.Count) mode=FIXTURE_SCHEMA_ONLY filtered=$($CaseId.Count -gt 0)"
