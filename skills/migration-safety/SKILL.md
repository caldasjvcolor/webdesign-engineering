---
name: migration-safety
description: Plan and gate database, schema, state, or configuration migrations for compatibility, partial execution, preservation, readback, rollback, and ordering.
---

# Migration safety

## Purpose

Move persisted contracts or data through a controlled transition without losing
authority, compatibility or recoverability.

## When to use

Use for database/schema, persistent state, configuration format or identity migrations.

## When not to use

Do not apply a migration plan as authorization for irreversible execution or deployment.

## Inputs

Current and target schemas/state, source of truth, readers/writers, data volumes,
deployment topology, mixed-version requirements, backups, idempotency and readback.

## Process

Define forward/backward compatibility and ordering; model partial execution,
retry/idempotency and mixed versions; preserve and validate data; prepare canary,
readback, rollback and irreversible-step gates; use integration-boundary for
external authority and high-risk-change for material execution.

## Evidence

Provide transition matrix, migration plan, backup proof, dry-run/canary results,
validation queries, readback, rollback test and residual risk.

## Done criteria

The transition is reversible where required, partial states are handled, ordering
is explicit and authorized evidence supports the current stage.

## Stop / escalation conditions

Stop on unprotected irreversible steps, incomplete backup, data-loss risk,
mixed-version incompatibility, uncertain partial execution or absent authority.
