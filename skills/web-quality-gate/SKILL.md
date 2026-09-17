---
name: web-quality-gate
description: "Assess whether a web-project change is actually ready to finish, including typecheck, lint, tests, production build, browser runtime, console errors, responsive behavior, navigation, forms, metadata, structured data, images, accessibility, and basic performance. Use for final verification or release readiness; do not treat compilation alone as done."
metadata:
  short-description: "Verify web work before completion"
---

# Web quality gate

## When to use

Use for final verification, release readiness, regression checks, or deciding
whether a web change is actually complete.

## When not to use

Do not use as a substitute for implementing the feature, and do not declare a
pass when a required runtime or browser check is unavailable.

## Inputs

The project profile, task scope, changed paths, available commands, browser
environment, expected journeys, and relevant quality surfaces.

## Purpose

Turn a web change into an evidence-backed completion decision. A passing build
is one signal, not the definition of done.

## Process

1. Read the project profile, task scope, changed paths, and existing validation
   commands. Choose checks proportionate to the change rather than running an
   unrelated full suite by reflex.
2. Run available typecheck, lint, focused tests, and production build checks.
   Record the exact command, result, environment, and limitations.
3. Use Playwright or the available browser QA capability when runtime behavior
   matters. Check the affected user journey, console errors, broken links,
   navigation, mobile and desktop layouts, and form states.
4. Inspect metadata, canonical URLs, robots, sitemap, structured data, image
   loading and alt text, semantic structure, keyboard access, and basic
   performance when those surfaces are in scope.
5. Classify the result as `GO`, `GO_WITH_FIXES`, `NO_GO`, or `UNKNOWN`. Do not
   convert an unavailable browser check into a passing claim.

## Validation helper

Run the deterministic preflight from a real web-project root:

```powershell
.\skills\web-quality-gate\scripts\verify-web-project.ps1 -Root .
```

Use `-RunChecks` only when the project owner has authorised running its local
validation commands. Read [definition-of-done.md](references/definition-of-done.md)
for the evidence matrix.

## Boundaries

Do not duplicate the complete instructions of a browser-testing Skill. Use the
available browser capability and record what it did and did not prove.

## Done criteria

- Relevant automated checks were run and recorded.
- Runtime checks were performed or clearly marked unavailable.
- Changed user journeys and responsive surfaces were inspected.
- Remaining risk, evidence limits, and gate outcome are explicit.

## Evidence

Record exact commands, results, environment, browser observations, changed
surfaces, limitations, and the final `GO`, `GO_WITH_FIXES`, `NO_GO`, or `UNKNOWN`.

## Stop / escalation conditions

Stop on failed critical checks, unexplained regressions, unknown runtime state,
unavailable evidence for a material claim, or a release/deploy action outside
the authorised scope.
