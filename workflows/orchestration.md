# ORCHESTRATION workflow

Use `AGENT_ORCHESTRATION.md` as the canonical protocol.

1. The ORCHESTRATOR establishes baseline and chooses the smallest useful shape.
2. Create up to two scoped read-only scout capsules only when independent
   evidence or context isolation is useful.
3. Synthesize findings centrally and define mutation slices.
4. Assign one WRITE_OWNER per slice with explicit allowed and forbidden scope.
5. Run deterministic validation, then a fresh read-only GATE.
6. Let the same WRITE_OWNER address at most two bounded correction loops.
7. Record agent usage, evidence, gate result, uncertainty and closure.
