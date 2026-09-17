---
name: task-planning
description: Turn an engineering objective into a bounded plan, risk mode, evidence plan, and reversible slices.
---

# Task planning

## Purpose

Convert intent into a task or campaign capsule that another agent can resume
without relying on conversation history.

## When to use

Use for work beyond a trivial local edit.

## When not to use

Skip when the task is already bounded, local and reversible. Never use planning
to invent scope that the user did not request.

## Inputs

Objective, repository profile, baseline, constraints, known risks, authorization
and available validation.

## Process

State objective, in/out scope, mode, baseline, protected contracts, dependencies,
unknowns, write owner, validation, rollback and stop conditions. Split work by
evidence boundary; serialize mutations and parallelize only independent reads or
reviews.

## Evidence

Persist the task capsule, slice boundaries, decision rationale and evidence plan.

## Done criteria

Each slice has an owner, inputs, expected evidence, rollback and a clear gate.

## Stop / escalation conditions

Escalate when authority, compatibility, rollback or target identity cannot be established.
