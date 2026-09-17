---
name: integration-boundary
description: Map and review external or cross-system integration authority, effects, result handling, retries, idempotency, and persistence boundaries.
---

# Integration boundary

## Purpose

Make cross-system behavior and authority explicit before changing or operating an integration.

## When to use

Use for external APIs, queues, services, authenticated UI flows, shared state or
cross-process contracts.

## When not to use

Do not use read access as evidence of write authority, and do not execute an
external action merely because its boundary was mapped.

## Inputs

Contracts, credentials/authority model, request and response schemas, persistence
owners, retries/timeouts, idempotency keys, logs, readback and human gates.

## Process

Classify each operation as `READ`, `PREPARE / NORMALIZE`, `WRITE`, `FINALIZE /
CANCEL`, `RESULT INTERPRETATION`, `UNKNOWN RESULT`, `RETRY / IDEMPOTENCY`,
`PERSISTENCE AUTHORITY` or `HUMAN AUTHORITY`; map transitions and failure modes;
define safe readback and retry policy. Never blindly retry an unknown result.

## Evidence

Return an authority/effect matrix, schemas, state transitions, result evidence,
retry/idempotency constraints and unresolved unknowns.

## Done criteria

Readers, writers, finalizers, result interpretation, persistence and human
authority are unambiguous for the scoped change.

## Stop / escalation conditions

Stop on unknown external outcome, missing authority, ambiguous identity,
unverifiable readback or unsafe retry semantics.
