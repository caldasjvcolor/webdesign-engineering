# Execution modes

Modes change process weight, never the safety principles in `CORE.md`.

| Mode | Use | Minimum process |
|---|---|---|
| QUICK | Small local change | baseline, focused change, focused verification |
| STANDARD | Normal feature or bug fix | map, plan, bounded write, tests, diff review |
| DEEP | Architecture or broad change | alternatives, dependency/blast-radius map, wider validation |
| LEGACY | Weak characterization or old system | characterize first, preserve behavior, incremental slices |
| HIGH_RISK | Auth, payment, migration, destructive/external | explicit contracts, rollback, independent review, protected authority |
| REVIEW | Read-only assessment | fresh context, evidence packets, findings and gate |
| RESEARCH | Technical uncertainty | question, source quality, competing hypotheses, applicability limits |

If the mode is unclear, choose the higher plausible risk and record why.
