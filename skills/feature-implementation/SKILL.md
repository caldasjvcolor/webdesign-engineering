---
name: feature-implementation
description: Implement a bounded feature or bug fix with explicit contracts, minimal changes, and proportional verification.
---

# Feature implementation

## Purpose

Deliver the smallest cohesive change that satisfies a planned requirement while
preserving unrelated behavior.

## When to use

Use for an authorized code or configuration change with a known target.

## When not to use

Do not use when the primary task is diagnosis, read-only review, architecture
assessment, or an uncharacterized legacy migration; route those first.

## Inputs

Approved requirement, task capsule, producer/consumer map, protected contracts,
baseline, validation plan and write boundary.

## Process

Confirm baseline and producer/consumer map; define behavior and compatibility;
assign one write owner; implement one slice; add or update focused tests; inspect
the diff and re-run checks after any correction.

## Evidence

Return changed paths, contract impact, tests, diff integrity, residual risks and rollback.

## Done criteria

Requested behavior and applicable local validation pass; external validation is
explicitly pending when not exercised.

## Stop / escalation conditions

Stop on scope expansion, conflicting contracts, unsafe overlap with unrelated
work, or required authority not granted.
