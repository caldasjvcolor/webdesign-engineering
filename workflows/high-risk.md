# HIGH_RISK workflow

1. Classify the risk and identify protected authority.
2. Map all readers/writers, invariants, compatibility and external boundaries.
3. Define backup/checkpoint, rollback, canary, readback and stop conditions.
4. Obtain explicit human authorization immediately before material mutation.
5. Use one write owner and an independent review gate.
6. Execute the smallest canary, validate, then decide whether to continue.
7. Record local, synthetic, integration and live evidence separately.

Any uncertain external result, failed gate or ambiguous target is a stop.
