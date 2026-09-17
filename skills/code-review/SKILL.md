---
name: code-review
description: Perform an independent, read-only review of a change for regressions, contract breaks, and missing evidence.
---

# Code review

## Purpose

Challenge the change from fresh context and produce a gate, not a second
implementation.

## When to use

Use for requested review or when risk justifies an independent gate.

## When not to use

Do not silently edit while reviewing. Use architecture-review when the question
is system structure rather than the correctness of a concrete delta.

## Inputs

Objective, acceptance criteria, baseline, current diff, protected contracts,
validation results and rollback plan.

## Process

Read objective and baseline, inspect the diff, trace affected contracts and
callers, check tests/rollback/compatibility, search for implicit side effects,
and prioritize actionable findings.

## Evidence

Each finding contains claim, evidence, confidence, impact and recommendation.

## Done criteria

Return `GO`, `GO_WITH_FIXES` or `NO_GO` with prioritized findings and residual risk.

## Stop / escalation conditions

An incomplete, failed or stale review returns `REVIEW_REQUIRED`, never approval.
