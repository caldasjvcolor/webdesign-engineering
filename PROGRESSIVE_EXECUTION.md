# Progressive execution protocol

Use this protocol only for campaigns or multi-phase work. QUICK and ordinary
STANDARD tasks should not inherit campaign bookkeeping.

The campaign loop is:

```text
accepted material phase
→ phase capsule
→ persist material delta
→ refresh affected evidence
→ re-rank remaining candidates
→ continue or stop for an explicit condition
```

A phase capsule records objective, scope, owner, baseline, changed surfaces,
evidence, gate, uncertainty and next candidates. Persist durable deltas and
decisions, not transcripts. Relevant findings become `STALE` after a change and
are refreshed only in the affected scope.

Deferring one candidate is valid progress, but does not end a campaign when
another safe, authorized and in-scope material action exists. Stop only at the
defined milestone, an explicit stop condition, exhausted safe in-scope work, or
a blocker requiring authority or information not available.
