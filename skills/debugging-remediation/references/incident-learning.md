# Incident learning

Create an incident record under `.engineering/incidents/` only when a failure
has reusable value: regression, repeat occurrence, framework trap, version
incompatibility, upstream bug, security or deployment issue, workaround,
difficult root cause, architectural error, or high diagnostic cost. Do not
record trivial typos, simple lint errors, obvious one-off mistakes, or
consequences-free exploration.

Use this compact format:

```text
Title:
Date:
Status:
Category:

Problem:
Expected:
Observed:
Environment / versions:
Reproduction:
Root cause:
Fix:
Verification:
Regression coverage:
External references:
Prevention:
Knowledge owner:
```

Choose one primary owner for the learning:

- `AGENTS.md`: short permanent cross-project rule.
- `PROJECT.md`: project-specific requirement.
- `DECISIONS.md`: durable architectural decision.
- Skill reference: reusable detailed knowledge.
- Test/eval: behaviour that can be checked.
- Script, linter, or validator: stable deterministic invariant.
- Incident record: compact history and evidence.

On the first material occurrence, diagnose, fix, verify, and add appropriate
coverage. On the second occurrence of the same failure class, ask why the
previous prevention failed and consider stronger coverage, a validator, linter,
architecture rule, Skill clarification, or quality-gate check. On the third,
classify it as a harness failure and record a short analysis of why the
regression coverage, Skill, quality gate, validator, or architecture boundary
did not prevent recurrence.
