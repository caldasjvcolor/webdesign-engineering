# CAMPAIGN workflow

Use for long-running work that must survive context changes. Follow
`PROGRESSIVE_EXECUTION.md`; do not apply this overhead to QUICK or ordinary
STANDARD tasks.

1. Create a campaign checkpoint in `.engineering/TASK.md` and append durable
   decisions to `.engineering/DECISIONS.md`.
2. Split work into evidence-bounded phases with a milestone and stop conditions.
3. For each accepted material phase, write a phase capsule, execute the owned
   delta, persist material evidence, refresh affected findings and re-rank the
   remaining candidates.
4. Start each phase from the current repository state, not an old transcript.
5. Keep findings `STALE` after relevant changes until revalidated.
6. A deferred candidate does not end the campaign while another safe,
   authorized, in-scope material action exists.
7. Consolidate after phase gates, validation and rollback status are recorded.
8. Stop at the campaign milestone or an explicit stop condition; do not
   auto-start a new campaign.
