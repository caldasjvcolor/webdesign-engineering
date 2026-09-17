---
name: progressive-refactor
description: Perform behavior-preserving refactoring in small characterized phases with verification, review, evidence refresh, and safe continuation.
---

# Progressive refactor

## Purpose

Improve structure incrementally while preserving observable behavior and keeping
each phase reversible and reviewable.

## When to use

Use for authorized structural improvement with stable intended behavior,
especially in large or coupled code.

## When not to use

Do not mix with feature changes, dead-code deletion, deduplication or broad
redesign unless each is separately scoped and authorized.

## Inputs

Characterized behavior, affected contract map, tests, baseline, phase boundary,
rollback, write owner and campaign capsule when multi-phase.

## Process

`CHARACTERIZE FIRST`; choose the smallest cohesive change; `MOVE FIRST, IMPROVE
LATER` when separation reduces risk; verify behavior; review the delta; refresh
affected evidence; re-rank and continue through the progressive campaign loop.
A safe defer is valid progress.

## Evidence

Record before/after ownership, behavior checks, diff, phase capsule, refreshed
findings and rollback.

## Done criteria

The accepted phase preserves characterized behavior, passes its gate and leaves
the next candidate or stop reason explicit.

## Stop / escalation conditions

Stop on behavior ambiguity, missing characterization, contract change, unsafe
ownership overlap or scope expansion into cleanup/redesign.
