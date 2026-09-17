---
name: release-preparation
description: Assess build and operational readiness for a release without authorizing deployment or publication.
---

# Release preparation

## Purpose

Establish whether the intended delta is ready to enter an authorized release process.

## When to use

Use before packaging, publishing, deployment, tagging or a release decision.

## When not to use

Do not treat readiness as authorization to deploy, publish, tag or push.

## Inputs

Intended delta, build/package outputs, required tests, migration plan, operational
dependencies, config/secrets prerequisites, rollback, monitoring and release notes.

## Process

Verify delta scope and package integrity; check tests, migration readiness,
dependencies and configuration; define canary and rollback where relevant;
confirm monitoring/observability; document residual risk and material release notes.

## Evidence

Provide artifact identity, commands/results, dependency/config checklist,
migration gate, canary/rollback plan, monitoring readiness and known risks.

## Done criteria

Return `READY`, `READY_WITH_CONDITIONS` or `NOT_READY` with explicit evidence and
remaining authorization boundaries.

## Stop / escalation conditions

Stop on artifact drift, failed required checks, missing prerequisites, unready
migration/rollback, inadequate monitoring or absent release authority.
