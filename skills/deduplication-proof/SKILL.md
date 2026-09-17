---
name: deduplication-proof
description: Prove whether similar implementations share the same responsibility and contract before consolidating them into a common abstraction.
---

# Deduplication proof

## Purpose

Prevent superficial similarity or line-count reduction from creating a harmful shared abstraction.

## When to use

Use when two or more implementations appear duplicative and consolidation is proposed.

## When not to use

Do not use similarity alone as evidence of shared responsibility, and do not use
this Skill for dead-code deletion.

## Inputs

Implementations, callers, contracts, state/side effects, error behavior, ordering,
performance constraints, lifecycle, history and expected future evolution.

## Process

Compare semantic equivalence and caller expectations; test side effects, errors,
ordering, performance and lifecycle differences; assess common ownership and
future divergence risk; choose `KEEP_SEPARATE`, `SHARE_PRIMITIVE`,
`CONSOLIDATE` or `REVIEW`.

## Evidence

Provide a comparison matrix, caller evidence, behavior tests, ownership rationale
and abstraction cost.

## Done criteria

The decision preserves contracts and ownership; any consolidation is smaller and
clearer than the duplication it replaces.

## Stop / escalation conditions

Stop on semantic uncertainty, divergent authority, hidden state, incompatible
lifecycle or an abstraction that requires condition-heavy special cases.
