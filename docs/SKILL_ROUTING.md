# Skill overlap and routing

Shared safety, evidence, ownership, context and authorization rules live in the
core protocols. The table records only pairs with plausible routing ambiguity.

| Potential overlap | Shared core principle | Unique responsibility | Routing rule |
|---|---|---|---|
| legacy-characterization / progressive-refactor | evidence before action | characterize unknown behavior / change known structure safely | characterize first; invoke refactor only after sufficient behavior evidence |
| integration-boundary / migration-safety | authority, readback, rollback | map cross-system effects / plan persisted transition states | migration invokes integration-boundary when external or shared authority is crossed |
| integration-boundary / progressive-refactor | smallest safe change | integration authority / behavior-preserving structure | map integration before refactoring across it; refactor does not grant write authority |
| architecture-review / post-change-stabilization | contract integrity | assess system structure / close integrity gaps after an accepted delta | architecture-review diagnoses structure; stabilization checks the bounded result |
| dead-code-proof / deduplication-proof | converging evidence | prove removability / prove shared responsibility and semantics | deletion uses dead-code-proof; consolidation of live code uses deduplication-proof |
| technical-research / adoption workflows | source quality and uncertainty | inform a decision / authorize and execute a change | research ends at recommendation or measured pilot; another authorized workflow adopts |
| code-review / architecture-review | independent evidence | gate a concrete diff / assess architecture independent of one diff | use code-review for the delta; add architecture-review only for structural claims |
| feature-implementation / progressive-refactor | bounded write and tests | add/change behavior / preserve behavior while changing structure | do not combine unless separately scoped and validated |
| high-risk-change / migration-safety | authority and rollback | cross-cutting execution gate / migration-specific transition proof | migration-safety designs evidence; high-risk-change gates irreversible execution |
| high-risk-change / release-preparation | explicit authority | material-action gate / readiness assessment | release-preparation never deploys; high-risk-change governs authorized material action |
| testing / specialized Skills | claims require proof | design evidence / define domain-specific claim and risk | specialized Skill defines what must be proven; testing chooses the evidence level |
| post-change-stabilization / release-preparation | integrity and residual risk | clean scoped aftermath / assess release readiness | stabilize accepted work before release readiness when integrity debt remains |
