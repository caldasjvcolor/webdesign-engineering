---
name: legacy-characterization
description: Establish observable behavior, state, side effects, dependencies, and unknowns in under-tested systems before modification.
---

# Legacy characterization

## Purpose

Build a trustworthy behavior and authority map for a system whose contracts are
incomplete, implicit or weakly tested.

## When to use

Use before modifying under-tested legacy code, dynamic systems or opaque flows.

## When not to use

Do not treat characterization as approval to refactor, delete or redesign.

## Inputs

Repository profile, entry points, representative fixtures, runtime observations,
history, tests, configuration and external-system boundaries.

## Process

Trace observed behavior, seams, side effects, dynamic references, hidden state,
error behavior, fallbacks and external dependencies; identify persistence and
human authority; add characterization tests at safe seams; record unknown
behavior explicitly instead of inferring it.

## Evidence

Provide observations, tests, paths/symbols, state transitions, side-effect map,
external assumptions, confidence and unknowns.

## Done criteria

The intended modification has enough characterized success, failure and boundary
behavior to plan safely; unresolved unknowns are visible.

## Stop / escalation conditions

Stop when observation would cause unsafe effects, authority is unclear, fixtures
are unrepresentative, or unknown behavior blocks a safe change.
