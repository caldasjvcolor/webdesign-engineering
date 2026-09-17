# Bootstrap

1. Review `manifest.json` and the project-independent `CORE.md`.
2. Install the repo harness with
   `scripts/Install-RepoHarness.ps1 -Destination <repo>`; use `-WhatIf` first.
   This writes `.engineering/` scaffolding but does not change application or
   runtime source.
3. Run `scripts/Validate-Toolkit.ps1 -Root .` before sharing or changing the
   toolkit.
4. Fill `.engineering/PROFILE.md` with source of truth, retrieval, validation,
   boundaries, risks, and rollback.
5. Fill `.engineering/TASK.md` for the current bounded objective and select one
   mode plus only the Skills needed for that task.
6. Establish a clean/readable baseline before writes; record pre-existing changes.
7. Map first, retrieve just in time, write serially, review independently when
   risk justifies it, then validate and record evidence.

## Root routing

Use `-InstallRootRouting` to create a root `AGENTS.md` only when none exists. If
the target already has `AGENTS.md`, the installer preserves it and points to
`.engineering/AGENTS.merge-snippet.md` for a manual, project-aware merge.

## Removal / rollback

This v0.2 writes only its optional repository scaffolding. Remove the owned
`.engineering/` files, and a root `AGENTS.md` only if the installer created it
and it has not acquired project content. Otherwise restore/merge through version
control. Do not delete application code or project state as part of removal.
