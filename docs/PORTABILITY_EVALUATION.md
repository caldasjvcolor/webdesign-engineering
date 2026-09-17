# Portability evaluation

This is a synthetic design evaluation, not cross-project validation.

| Project class | Minimum core | Applicable Skills | Campaign? | Multi-agent? | Expected evidence | Process check |
|---|---|---|---|---|---|---|
| A. 300-line utility/script | baseline, change safety, claim/proof | repository-orientation only if unfamiliar; feature-implementation, debugging, testing | No for ordinary work | No | focused test, diff, rollback | QUICK avoids excess; safety is sufficient unless external/destructive effects exist |
| B. frontend/backend application | profile, contracts, ownership, change safety | repository-orientation, task-planning, feature-implementation, debugging, testing, integration-boundary, code-review, release-preparation/post-change-stabilization as needed | Only for multi-phase work | Only for independent boundaries/review | client/server contract, build/tests, runtime or API evidence | STANDARD fits; hidden coupling requires boundary map |
| C. Python service | profile, dependency/runtime truth, change safety | repository-orientation, feature-implementation, debugging, testing, technical-research, release-preparation | Usually no | Usually no | environment, dependency lock, focused/full tests, service probe | STANDARD fits; do not mistake local tests for deployed behavior |
| D. large legacy monolith | repository memory, progressive disclosure, stale findings | legacy-characterization, progressive-refactor, architecture-review, dead-code-proof, deduplication-proof, testing, code-review | Yes for sustained work | Useful for independent mapping/gates, not mandatory by size | characterization tests, dynamic-reference search, phase capsules, refreshed blast radius | LEGACY/DEEP is proportionate; safety is insufficient without observed behavior |
| E. database + external API | authority, change safety, human gate | integration-boundary, migration-safety, testing, high-risk-change, release-preparation, post-change-stabilization | Often | Useful when migration and integration can be reviewed independently | schema/state transition, readback, idempotency, canary, rollback | HIGH_RISK where writes/migration occur; unknown results must stop blind retry |
| F. auth/payment/data migration | all core, explicit authority, independent gate | architecture-review, integration-boundary, migration-safety, high-risk-change, testing, release-preparation, code-review | Yes | Normally justified for independent safety review | threat/authority map, backups, mixed-version proof, canary, monitoring, rollback | Process is not excessive; safety is insufficient without authorization and live readback |
| G. multi-package / monorepo | scoped source of truth, ownership, agent legibility | repository-orientation, task-planning, architecture-review, integration-boundary, testing, release-preparation, context-management | Only for cross-package or long-running work | Useful for genuinely independent packages and a fresh gate | package graph, affected-package builds/tests, boundary contracts, release ordering | Scope by package; avoid loading or mutating unrelated packages |

## Findings

- QUICK and ordinary STANDARD work do not require campaign or multi-agent overhead.
- No universal tool, language, framework, VCS or deployment platform is assumed.
- Monorepos require scoped ownership and package-level validation, not a global
  read or write by default.
- Safety is insufficient when authority, rollback, readback, dynamic behavior or
  mixed-version compatibility is material but unproven.
- CF-specific operational contracts are absent; only provenance/status labels
  refer to the reference project.
