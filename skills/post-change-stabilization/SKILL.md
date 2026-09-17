---
name: post-change-stabilization
description: Perform bounded integrity cleanup after substantial work by finding stale documentation, ownership drift, scaffolding, broken references, warnings, and test gaps.
---

# Post-change stabilization

## Purpose

Close integrity gaps introduced or exposed by a substantial completed change.

## When to use

Use after a multi-file, multi-phase, migration, refactor or architecture-affecting change.

## When not to use

Do not turn stabilization into unrelated feature work, redesign or broad cleanup.

## Inputs

Accepted delta, task/campaign capsule, architecture/contracts, validation output,
temporary scaffolding, documentation and known residual risks.

## Process

Check stale documentation, accidental duplication, inconsistent ownership,
leftover scaffolding, warnings, broken links/references, temporary compatibility
layers, test gaps and architecture/contract drift; fix only issues caused by or
required to safely close the scoped change; defer unrelated findings.

## Evidence

Provide integrity findings, ownership/reference checks, warnings, tests, removed
scaffolding and explicit deferrals.

## Done criteria

The changed area is internally coherent, validation is current and residual risk
is documented without unrelated scope expansion.

## Stop / escalation conditions

Stop when a finding requires new product behavior, broad redesign, destructive
cleanup or authority beyond the original change.
