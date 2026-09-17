---
name: high-risk-change
description: Gate security-sensitive, destructive, external, contract, release, or data-migration changes with explicit authority and rollback.
---

# High-risk change

## Purpose

Make irreversible or broad changes observable, reversible where possible, and
independently reviewable.

## When to use

Use for authentication, payments, secrets, persistence migrations, external
writes, releases, deletion, or changes with material blast radius.

## When not to use

Do not apply the full process to a genuinely local low-risk edit. Use specialized
Skills for the technical analysis, with this Skill providing the authority gate.

## Inputs

Task capsule, authority map, all readers/writers, invariants, backup, rollback,
canary/readback plan, credentials boundary and independent reviewer.

## Process

Map authority and all readers/writers; define invariants, compatibility, backup,
rollback, canary, readback and stop conditions; require one write owner and an
independent reviewer; perform external actions only after explicit authorization.

## Evidence

Require pre/post evidence, rollback readiness, review gate, and clear separation
of local versus live validation.

## Done criteria

The authorized bounded action is verified or safely rolled back, with residual
risk and external state explicit.

## Stop / escalation conditions

Stop on ambiguous identity, uncertain external outcome, failed gate, missing
backup, or absent human authority.
