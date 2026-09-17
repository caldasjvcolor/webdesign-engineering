---
name: architecture-review
description: Review system structure and boundaries, separating evidenced architectural defects from design preferences without authorizing redesign.
---

# Architecture review

## Purpose

Assess responsibility, ownership, dependency direction, coupling, cycles,
boundaries, layering and source-of-truth clarity.

## When to use

Use for an architecture assessment, cross-domain dependency concern, public or
internal contract review, or a proposed structural change.

## When not to use

Do not use for ordinary delta review or to justify redesign from preference alone.

## Inputs

Project profile, structural/dependency map, entry points, ownership, public and
internal contracts, persistence authority, representative source and tests.

## Process

Map responsibilities and sources of truth; trace dependency direction, cycles,
coupling and domain crossings; test declared boundaries against evidence;
classify each observation as `DESIGN_PREFERENCE`, `EVIDENCED_ARCHITECTURAL_DEFECT`
or `UNKNOWN`; propose the smallest decision or experiment that resolves risk.

## Evidence

Provide paths/symbols, dependency edges, contract violations, runtime evidence
where needed, confidence and impact.

## Done criteria

Material findings have classification, evidence, affected boundary and a bounded
recommendation; preferences are not presented as defects.

## Stop / escalation conditions

Stop when topology or runtime behavior is materially unknown, ownership conflicts,
or remediation would require an unauthorized redesign.
