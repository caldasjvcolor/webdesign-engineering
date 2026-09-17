[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string] $Destination,

    [switch] $Force,

    [switch] $InstallRootRouting
)

$ErrorActionPreference = 'Stop'
$source = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\repo-harness'))
$targetRoot = [IO.Path]::GetFullPath($Destination)
$target = Join-Path $targetRoot '.engineering'
$routingSource = Join-Path $source 'AGENTS.merge-snippet.md'
$rootAgents = Join-Path $targetRoot 'AGENTS.md'

if (-not (Test-Path -LiteralPath $targetRoot -PathType Container)) {
    throw "Destination does not exist or is not a directory: $targetRoot"
}
if (-not (Test-Path -LiteralPath $source -PathType Container)) {
    throw "Toolkit repo-harness directory is missing: $source"
}
if ($InstallRootRouting -and -not (Test-Path -LiteralPath $routingSource -PathType Leaf)) {
    throw "Root routing snippet is missing: $routingSource"
}
if ((Test-Path -LiteralPath $target) -and -not $Force) {
    throw "Refusing to overwrite existing harness: $target. Use -Force only after reviewing it."
}

if ($PSCmdlet.ShouldProcess($target, 'Install repository harness templates')) {
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-Item -Path (Join-Path $source '*') -Destination $target -Recurse -Force:$Force
    Write-Output "Installed .engineering scaffolding at $target; application/runtime source was not modified."
}

if ($InstallRootRouting) {
    if (Test-Path -LiteralPath $rootAgents) {
        Write-Warning "Existing AGENTS.md preserved. Merge routing manually from $target\AGENTS.merge-snippet.md"
    }
    elseif ($PSCmdlet.ShouldProcess($rootAgents, 'Create root harness routing')) {
        Copy-Item -LiteralPath $routingSource -Destination $rootAgents
        Write-Output "Created root routing at $rootAgents"
    }
}
