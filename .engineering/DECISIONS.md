# Decision log

Record durable decisions, not a transcript.

| Date | Decision | Evidence | Alternatives / trade-off | Owner | Revisit trigger |
|---|---|---|---|---|---|
| 2026-09-17 | Keep seven local Skills small and composable | User brief; official OpenAI Skills guidance | One large web skill would reduce routing precision and increase context load | Current agent | Repeated overlap in real use |
| 2026-09-17 | Reuse bundled upstream capabilities instead of copying them | `skill-creator`, `skill-installer`, `vercel-react-best-practices`, `web-design-guidelines`, `computer-use`, `imagegen` inspected | HTTP 403 prevented a fresh curated-list inventory; no unsupported upstream claim added | Current agent | Upstream probe becomes available |
| 2026-09-17 | Keep DJ facts under `projects/dj-joao-caldas/` | User-provided brief | Global Skill facts would leak project assumptions into unrelated sites | Current agent | Project profile changes |
| 2026-09-17 | Make update checking report-only | No reliable upstream endpoint and local changes must be preserved | Automatic copying would risk overwriting local work and duplicating upstream content | Current agent | A reviewed, supported updater mechanism becomes available |
| 2026-09-17 | Integrate the full v0.2 base and keep the web toolkit as an extension | 18 base Skills plus 7 non-colliding web Skills; base validator passes with merged manifest | Copying source `AGENTS.md`, `README.md`, and `.engineering/` would overwrite project-specific routing and profile; these were composed instead | Current agent | Base or extension contract changes |
