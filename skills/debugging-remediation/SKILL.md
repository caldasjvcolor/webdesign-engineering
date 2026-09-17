---
name: debugging-remediation
description: "Diagnose and remediate material build, runtime, test, regression, browser, dependency, deployment, security, or integration failures. Use for unexpected behaviour, repeated failed fixes, or an unclear cause; do not use for normal feature development without a defect."
metadata:
  short-description: "Diagnose failures and prevent regressions"
---

# Debugging remediation

## When to use

Use for a concrete failure or material defect: build or runtime error, failing
test, regression, browser-only bug, unexpected behaviour, framework warning,
dependency/version issue, deployment failure, security finding, integration
failure, repeated failed fix, or difficult-to-explain bug.

Do not load this Skill for ordinary feature development without a defect.

## When not to use

Do not use for normal feature work, a trivial typo, a simple lint correction,
or exploratory work with no material failure or reusable learning.

## Inputs

The observed error or unexpected behaviour, expected result, reproduction when
available, smallest affected surface, relevant versions, and existing evidence.

## Purpose

Turn a material failure into an evidence-backed minimal fix, appropriate
regression prevention, and a reusable lesson only when it will help later work.

## Process

1. **Orient.** Record only the observed error, expected and actual behaviour,
   affected area, reproducing command or action, relevant framework/library,
   and installed versions.
2. **Reproduce and isolate.** Reproduce when reasonably practical and preserve
   the smallest useful evidence. Start with one failing test, route, component,
   request, or integration rather than the whole project.
3. **Use local evidence first.** Read only the relevant project instructions,
   decisions, incident index, tests/evals, code, and Skill references. Do not
   infer a root cause when reproduction is unavailable. Follow
   [`CONTEXT_EFFICIENCY.md`](../../.engineering/CONTEXT_EFFICIENCY.md) for
   context escalation, bounded evidence, reread prevention, and research stops.
4. **Research only when justified.** External research is conditional, never a
   default. Read [research-policy.md](references/research-policy.md) only for
   its stated triggers.
5. **Establish cause and prevention.** Keep symptom, hypothesis, and verified
   root cause distinct. Read
   [root-cause-workflow.md](references/root-cause-workflow.md) for the
   evidence and regression-coverage decision.
6. **Fix and verify.** Apply the smallest evidence-backed change. Do not claim
   it is fixed without observed verification and stated limitations.
7. **Capture reusable learning.** For a material or recurrent incident, read
   [incident-learning.md](references/incident-learning.md). Keep one primary
   owner for the lesson; do not duplicate its full rule elsewhere.

## Delegation

- Use `nextjs` for Next.js-specific behaviour after checking the installed
  version.
- Use `vercel-react-best-practices` for React rendering or performance causes.
- Use `security-best-practices` for security findings.
- Use `playwright` when the failure can only be reproduced or verified in a
  browser.

Do not copy those Skills' detailed guidance into this one.

## Evidence packet

When the defect belongs to a task or campaign, record the original failure,
reproduction, fix, verification, and prevention briefly in its evidence
packet. Do not duplicate a full incident record.

## Evidence

Record the reproduction, observations, verified cause or remaining hypothesis,
changed surface, check result, regression coverage, and limitations. Link an
incident only when one is justified.

## Done criteria

- The diagnosis labels fact, hypothesis, and unknown separately.
- The fix is proportionate to the verified cause.
- Verification matches the observed failure.
- Regression coverage is added when practical and reliable.
- Reusable learning has one appropriate owner, or the reason for not recording
  it is clear.

## Stop / escalation conditions

Stop and report uncertainty when the failure cannot be reproduced or safely
isolated, a material external action lacks authority, a dependency or provider
behaviour needs version-compatible evidence, or verification for a material
claim is unavailable.
