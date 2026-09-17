---
name: debugging
description: Diagnose an engineering failure by reproducing it, narrowing hypotheses, and proving the smallest safe fix.
---

# Debugging

## Purpose

Separate observed facts from hypotheses and identify the causal boundary before
changing code.

## When to use

Use for a failing test, runtime error, regression or unexplained behavior.

## When not to use

Do not use a speculative fix as a substitute for a reproducible symptom when
evidence can be collected safely. Use technical research for uncertainty that is
primarily external or conceptual.

## Inputs

Exact symptom, environment, baseline, logs/errors, reproduction steps, affected
contracts and recent changes.

## Process

Capture exact symptom and baseline; reproduce with the smallest fixture; map the
execution path; rank hypotheses; add the least invasive diagnostic or regression
test; fix only after cause is supported; verify adjacent behavior.

## Evidence

Provide reproduction, ranked hypotheses, causal evidence, regression test,
changed behavior and remaining unknowns.

## Done criteria

The causal boundary is supported and the smallest safe fix or blocker is clear.

## Stop / escalation conditions

Stop if reproduction requires unsafe external writes, evidence is insufficient,
or multiple authorities disagree.
