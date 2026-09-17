# Engineering profile

## Identity

- Repository: `Webdesign Engineering`
- Purpose: complete Engineering Agent Harness v0.2 plus a modular web-development extension and factual web-project profiles
- Stack / runtime: Markdown, JSON, Python standard library, PowerShell; no application runtime yet
- Maintainer / authority: current user; external facts require an explicit project source
- Source of truth: `CORE.md`, `manifest.json`, `README.md`, `toolkit-manifest.json`, each `skills/*/SKILL.md`, and `projects/*/PROJECT.md`

## Retrieval

- Structural map: `README.md`, `manifest.json`, and `toolkit-manifest.json`
- Text search: `rg --files` followed by targeted `rg`
- Important entry points: `AGENTS.md`, `CORE.md`, `.engineering/TASK.md`, `workflows/`, local Skill descriptions, project profiles
- Protected contracts: no upstream Skill content copied; project facts stay in project profiles; no secrets

## Validation

- Base toolkit structure: `scripts/Validate-Toolkit.ps1`
- Local Skill structure: `scripts/validate-skills.ps1`
- Base eval fixtures: `scripts/Run-CoreEvals.ps1`
- Web eval fixtures: `scripts/run-evals.ps1`
- Skill-specific scripts: run from their documented Skill directory
- Runtime/browser checks: only against a real target web project
- Evidence location: `.engineering/DECISIONS.md` and the current task/campaign checkpoint

## Version control / change safety

- Status command: `git status --short --branch` when Git is present
- Dirty/pre-existing changes: preserve them; this project may initially be untracked
- Task-owned delta: only files needed for this toolkit implementation
- Diff command: `git diff -- .` and `git diff --no-index` where appropriate
- Commit / merge / tag authorization: separate explicit user decision
- Push / publish / deploy authorization: separate explicit user decision
- Rollback: remove only this task's owned files after readback; never reset unrelated work

## Boundaries

- External systems: official Codex/Skill sources are consulted only for current guidance; no credentials or external writes
- Persistent state: repository files and project-profile facts
- Credentials / secrets boundary: never read, copy, print, or place secrets in this toolkit
- Irreversible actions: publication, deployment, external mutations, and Git history changes require explicit authority
- Project-specific stop conditions: unknown fact, unsupported upstream claim, failed validator, or ambiguous ownership

## Status

- Profile owner: current implementation task
- Last verified: 2026-09-17
- Known uncertainty: the upstream curated Skill listing returned HTTP 403; available bundled Skills are recorded instead
