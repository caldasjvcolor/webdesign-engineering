---
name: dead-code-proof
description: Determine whether code is safely removable using converging static, dynamic, runtime, configuration, history, and recovery-path evidence.
---

# Dead-code proof

## Purpose

Distinguish unused-code candidates from code that is proven safe to delete.

## When to use

Use when deletion is proposed because a symbol, file, export or dependency appears unused.

## When not to use

Do not use a single tool finding as deletion authority. Feature flag `OFF` is not dead code.

## Inputs

Candidate scope, static and textual references, configuration/flags, registration
and reflection, runtime entry points, external consumers, tests, history,
generated-code boundaries and fallback/recovery paths.

## Process

Cross-check all inputs; classify `KEEP`, `REVIEW`, `DELETE_CANDIDATE` or
`DELETE_READY`; define compatibility and rollback; perform deletion only as a
separately owned/authorized delta; verify behavior and packaging after removal.

## Evidence

Provide converging reference searches, runtime/config evidence, consumer review,
history, tests, deletion diff and post-removal verification.

## Done criteria

The candidate is retained with reason or separately deleted with corroborated
evidence, focused review and regression validation.

## Stop / escalation conditions

Stop on dynamic or external uncertainty, generated ownership, active fallback,
flag-only evidence, missing tests or incompatible consumers.
