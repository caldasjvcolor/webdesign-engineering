[CmdletBinding()]
param(
    [string] $Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$rootPath = [IO.Path]::GetFullPath($Root)
$manifestPath = Join-Path $rootPath 'manifest.json'
$startedAt = [DateTimeOffset]::Now

function Assert-Condition([bool] $Condition, [string] $Message) {
    if (-not $Condition) { throw $Message }
}

function Get-RelativePath([string] $Path) {
    return $Path.Substring($rootPath.Length).TrimStart([char[]]'\/')
}

Assert-Condition (Test-Path -LiteralPath $manifestPath -PathType Leaf) "Missing manifest: $manifestPath"
$manifest = Get-Content -Raw -LiteralPath $manifestPath | ConvertFrom-Json
Assert-Condition ($manifest.version -eq '0.2.0') "Expected manifest version 0.2.0, got $($manifest.version)"
Assert-Condition ($manifest.package -eq 'engineering-agent-harness-v0.2') "Unexpected package name: $($manifest.package)"
$isIntegratedPackage = $manifest.PSObject.Properties.Name -contains 'integration' -and $manifest.integration.kind -eq 'base-plus-extension'
Assert-Condition (((Split-Path -Leaf $rootPath) -eq $manifest.package) -or $isIntegratedPackage) "Root directory does not match package name: $rootPath"
Assert-Condition ($manifest.PSObject.Properties.Name -notcontains 'planned_capabilities') 'planned_capabilities is not allowed in completed v0.2'

foreach ($surface in $manifest.surfaces.PSObject.Properties) {
    Assert-Condition (Test-Path -LiteralPath (Join-Path $rootPath $surface.Value)) "Missing manifest surface: $($surface.Name) -> $($surface.Value)"
}

foreach ($requiredSurface in @('TRUST_BOUNDARY.md', 'docs/CAPABILITY_CONTRACT.md', 'docs/PROVENANCE.md', 'evals', 'docs/host-profiles')) {
    Assert-Condition (Test-Path -LiteralPath (Join-Path $rootPath $requiredSurface)) "Missing hardened v0.2 surface: $requiredSurface"
}
foreach ($toolPath in @($manifest.installer, $manifest.validator, $manifest.core_evals_runner)) {
    Assert-Condition (Test-Path -LiteralPath (Join-Path $rootPath $toolPath) -PathType Leaf) "Missing manifest tool: $toolPath"
}

$requiredSections = @(
    'Purpose',
    'When to use',
    'When not to use',
    'Inputs',
    'Process',
    'Evidence',
    'Done criteria',
    'Stop / escalation conditions'
)
$mandatoryV02 = @(
    'architecture-review',
    'progressive-refactor',
    'legacy-characterization',
    'integration-boundary',
    'dead-code-proof',
    'deduplication-proof',
    'migration-safety',
    'release-preparation',
    'post-change-stabilization',
    'technical-research'
)

$skillNames = @()
$skillPaths = @()
foreach ($skill in @($manifest.skills)) {
    $skillPath = Join-Path $rootPath $skill.path
    Assert-Condition (Test-Path -LiteralPath $skillPath -PathType Leaf) "Missing Skill: $($skill.path)"
    Assert-Condition ($skill.path -like 'skills/*/SKILL.md') "Skill path is not canonical: $($skill.path)"
    Assert-Condition ($skill.status -ne 'PLANNED') "Implemented Skill is marked PLANNED: $($skill.name)"
    $content = Get-Content -Raw -LiteralPath $skillPath
    $name = ([regex]::Match($content, '(?m)^name:\s*(.+)$')).Groups[1].Value.Trim()
    $description = ([regex]::Match($content, '(?m)^description:\s*(.+)$')).Groups[1].Value.Trim()
    Assert-Condition ($content.StartsWith('---')) "Missing frontmatter: $($skill.path)"
    Assert-Condition ($name -eq $skill.name) "Manifest/Skill name mismatch: $($skill.name) != $name"
    Assert-Condition ($description.Length -gt 0) "Missing Skill description: $($skill.path)"
    foreach ($section in $requiredSections) {
        $sectionPattern = '(?im)^##\s+' + [regex]::Escape($section) + '\s*$'
        Assert-Condition ($content -match $sectionPattern) "Skill $($skill.name) is missing section: $section"
    }
    $skillNames += $skill.name
    $skillPaths += [IO.Path]::GetFullPath($skillPath)
}
Assert-Condition (@($skillNames | Sort-Object -Unique).Count -eq $skillNames.Count) 'Duplicate Skill names in manifest'
foreach ($requiredSkill in $mandatoryV02) {
    Assert-Condition ($skillNames -contains $requiredSkill) "Mandatory v0.2 Skill is absent: $requiredSkill"
}

$actualSkillPaths = @(Get-ChildItem -LiteralPath (Join-Path $rootPath 'skills') -Recurse -Filter 'SKILL.md' -File | ForEach-Object { $_.FullName })
Assert-Condition ($actualSkillPaths.Count -eq $skillPaths.Count) 'Unindexed or duplicate canonical Skill entrypoint detected'
foreach ($actualSkillPath in $actualSkillPaths) {
    Assert-Condition ($skillPaths -contains $actualSkillPath) "Skill exists but is absent from manifest: $(Get-RelativePath $actualSkillPath)"
}

$workflowPaths = @()
foreach ($workflow in @($manifest.workflows)) {
    $workflowPath = [IO.Path]::GetFullPath((Join-Path $rootPath $workflow))
    Assert-Condition (Test-Path -LiteralPath $workflowPath -PathType Leaf) "Missing workflow: $workflow"
    $workflowPaths += $workflowPath
}
$actualWorkflowPaths = @(Get-ChildItem -LiteralPath (Join-Path $rootPath 'workflows') -Filter '*.md' -File | ForEach-Object { $_.FullName })
Assert-Condition ($actualWorkflowPaths.Count -eq $workflowPaths.Count) 'Unindexed or duplicate workflow detected'
foreach ($actualWorkflowPath in $actualWorkflowPaths) {
    Assert-Condition ($workflowPaths -contains $actualWorkflowPath) "Workflow exists but is absent from manifest: $(Get-RelativePath $actualWorkflowPath)"
}

$repoHarnessPath = Join-Path $rootPath 'repo-harness'
$projectScaffoldPath = [IO.Path]::GetFullPath((Join-Path $rootPath '.engineering')) + [IO.Path]::DirectorySeparatorChar
$indexedHarnessFiles = @($manifest.repo_harness_files | Sort-Object)
$actualHarnessFiles = @(Get-ChildItem -LiteralPath $repoHarnessPath -File | ForEach-Object { $_.Name } | Sort-Object)
Assert-Condition ($indexedHarnessFiles.Count -eq $actualHarnessFiles.Count) 'Manifest/repo-harness file count mismatch'
Assert-Condition (-not (Compare-Object $indexedHarnessFiles $actualHarnessFiles)) 'Manifest/repo-harness index mismatch'

foreach ($canonicalTemplate in @('PROFILE.md', 'TASK.md', 'CAMPAIGN.md', 'EVIDENCE_PACKET.template.md', 'DECISIONS.md')) {
    $canonicalPath = [IO.Path]::GetFullPath((Join-Path $repoHarnessPath $canonicalTemplate))
    Assert-Condition (Test-Path -LiteralPath $canonicalPath -PathType Leaf) "Missing canonical template owner: $canonicalTemplate"
    $allowedSameNamePaths = @($canonicalPath)
    if ($canonicalTemplate -eq 'CAMPAIGN.md') {
        $allowedSameNamePaths += [IO.Path]::GetFullPath((Join-Path $rootPath 'workflows\campaign.md'))
    }
    $unexpectedOwners = @(Get-ChildItem -LiteralPath $rootPath -Recurse -File -Filter $canonicalTemplate | Where-Object {
        $allowedSameNamePaths -notcontains $_.FullName -and
        -not $_.FullName.StartsWith($projectScaffoldPath, [StringComparison]::OrdinalIgnoreCase)
    })
    Assert-Condition ($unexpectedOwners.Count -eq 0) "Duplicate canonical template owner: $canonicalTemplate"
}

$routingPath = Join-Path $repoHarnessPath 'AGENTS.merge-snippet.md'
$routing = Get-Content -Raw -LiteralPath $routingPath
foreach ($route in @('.engineering/PROFILE.md', '.engineering/TASK.md', '.engineering/CAMPAIGN.md')) {
    Assert-Condition ($routing.Contains($route)) "Root routing is missing: $route"
}
Assert-Condition ($routing -match 'never\s+overwrite.*AGENTS\.md') 'Root routing lacks AGENTS.md no-overwrite guidance'

$matrixPath = Join-Path $rootPath 'docs\CAPABILITY_MATRIX.md'
$matrix = Get-Content -Raw -LiteralPath $matrixPath
foreach ($skillName in $skillNames) {
    Assert-Condition ($matrix.Contains("``$skillName``")) "Capability matrix omits implemented Skill: $skillName"
}

$coreEvalCases = @(Get-ChildItem -LiteralPath (Join-Path $rootPath 'evals\cases') -Filter 'EVAL_*.json' -File)
Assert-Condition ($coreEvalCases.Count -eq 4) "Expected 4 deterministic core eval cases, got $($coreEvalCases.Count)"
foreach ($coreEvalCase in $coreEvalCases) {
    $case = Get-Content -Raw -LiteralPath $coreEvalCase.FullName | ConvertFrom-Json
    foreach ($field in @('id', 'objective', 'setup', 'request', 'expected', 'invariants')) {
        Assert-Condition ($case.PSObject.Properties.Name -contains $field) "Core eval missing field: $($coreEvalCase.Name) -> $field"
    }
}

$hostProfileFiles = @(Get-ChildItem -LiteralPath (Join-Path $rootPath 'docs\host-profiles') -Filter '*.md' -File)
Assert-Condition ($hostProfileFiles.Count -eq 3) "Expected 3 Granite host profile files, got $($hostProfileFiles.Count)"

$markdownFiles = @(Get-ChildItem -LiteralPath $rootPath -Recurse -File -Filter '*.md')
foreach ($markdownFile in $markdownFiles) {
    $content = Get-Content -Raw -LiteralPath $markdownFile.FullName
    foreach ($linkMatch in [regex]::Matches($content, '\]\(([^)]+)\)')) {
        $reference = $linkMatch.Groups[1].Value.Trim('<', '>')
        if ($reference -match '^(https?://|mailto:|codex://|#)') { continue }
        $referencePath = $reference.Split('#')[0]
        if ($referencePath.Length -eq 0) { continue }
        $resolvedReference = [IO.Path]::GetFullPath((Join-Path $markdownFile.DirectoryName $referencePath))
        Assert-Condition (Test-Path -LiteralPath $resolvedReference) "Broken internal link in $(Get-RelativePath $markdownFile.FullName): $reference"
    }
}

$staleVersionPattern = 'engineering-agent-harness-v0\.' + '1(?:\.0)?'
$textFiles = @(Get-ChildItem -LiteralPath $rootPath -Recurse -File | Where-Object { $_.Extension -in @('.md', '.json', '.ps1') })
$staleVersionHits = @($textFiles | Select-String -Pattern $staleVersionPattern)
Assert-Condition ($staleVersionHits.Count -eq 0) 'Stale prior-version reference found'

foreach ($scriptName in @('Install-RepoHarness.ps1', 'Validate-Toolkit.ps1', 'Run-CoreEvals.ps1')) {
    $tokens = $null
    $parseErrors = $null
    [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $rootPath "scripts\$scriptName"), [ref]$tokens, [ref]$parseErrors) | Out-Null
    Assert-Condition ($parseErrors.Count -eq 0) "PowerShell parse failure in $scriptName"
}

$finishedAt = [DateTimeOffset]::Now
$manifestHash = (Get-FileHash -LiteralPath $manifestPath -Algorithm SHA256).Hash
$validatorHash = (Get-FileHash -LiteralPath $MyInvocation.MyCommand.Path -Algorithm SHA256).Hash
$provenance = [ordered]@{
    validation_id = 'Validate-Toolkit'
    artifact_id = 'manifest.json and indexed toolkit surfaces'
    artifact_hash = $manifestHash
    validator = 'scripts/Validate-Toolkit.ps1'
    validator_hash = $validatorHash
    result = 'PASS'
    started_at = $startedAt.ToString('o')
    finished_at = $finishedAt.ToString('o')
    environment = "Windows PowerShell $($PSVersionTable.PSVersion) path=$rootPath"
    limitations = 'Structural, manifest, link and parser checks; no runtime or host behavior'
}
"PASS package=$($manifest.package) version=$($manifest.version) skills=$($skillNames.Count) workflows=$($workflowPaths.Count) repo_harness_files=$($actualHarnessFiles.Count) markdown_files=$($markdownFiles.Count)"
"PROVENANCE $($provenance | ConvertTo-Json -Compress)"
