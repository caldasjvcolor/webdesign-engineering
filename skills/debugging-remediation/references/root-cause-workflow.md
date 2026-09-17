# Root-cause workflow

Keep these labels separate:

- **Symptom:** observed failure and its evidence.
- **Hypothesis:** plausible explanation still requiring a check.
- **Verified root cause:** condition shown to make the failure possible.

Before changing code, orient on the minimum affected surface and reproduce the
failure when practical. Capture the command or action, error, failing test,
relevant log, browser state, or screenshot. If it cannot be reproduced, state
the limitation and keep the explanation as a hypothesis.

Ask which condition made the failure possible. Prefer the smallest check that
can distinguish hypotheses. Make the smallest supported fix; do not weaken
tests, suppress warnings, add a dependency, or refactor unrelated code merely
to remove a local symptom.

When a failure is reproducible and verification is reliable, use the smallest
appropriate regression mechanism:

- unit test for isolated logic;
- integration test for component or request boundaries;
- Playwright test for browser-only behaviour;
- eval, static check, validator, or linter for stable non-runtime invariants.

Use RED -> FIX -> GREEN when a failing check can credibly represent the defect.
Record the exact verification, result, limitations, and surfaces not checked.
