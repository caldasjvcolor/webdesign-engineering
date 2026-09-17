---
name: testing
description: Design and run risk-proportional tests that distinguish local, synthetic, integration, and live evidence.
---

# Testing

## Purpose

Turn a behavior or contract into observable evidence without overstating what a
test proves.

## When to use

Use when planning, implementing, reviewing or validating a change.

## When not to use

Do not add tests that merely assert wording or implementation shape unless that
shape is a protected contract. Testing does not replace live evidence for an
external claim.

## Inputs

Expected behavior, risk mode, contracts, fixtures, environments, baseline and
known failure modes.

## Process

Choose tests from the risk: focused unit/contract checks, regression cases,
structural checks, integration canaries, or controlled runtime validation. Cover
success, failure, boundary and compatibility cases. Record environment and
limitations.

## Evidence

Report exact commands and outcomes, scope, fixtures, environment and untested boundaries.

## Done criteria

The test set supports the stated claim at the declared evidence level.

## Stop / escalation conditions

Failed, skipped or incomplete validation is not approval; escalate when evidence
cannot support the claim or would require unsafe live effects.
