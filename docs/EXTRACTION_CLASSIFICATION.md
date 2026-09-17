# CF extraction classification

## Generalized into the harness

| Reference practice | Classification | Harness form |
|---|---|---|
| progressive context loading | GENERIC | core rules 2–3 |
| repository as durable memory | GENERIC | core rule 1 |
| evidence packets and confidence | GENERALIZABLE | gate vocabulary and task capsule |
| one bounded write owner | GENERALIZABLE | core rule 7 |
| independent review gate | GENERALIZABLE | core rule 8 and REVIEW mode |
| tool roles must not become authority | GENERALIZABLE | tool-neutral profile and gates |
| characterization before legacy change | GENERALIZABLE | LEGACY mode plus `legacy-characterization` Skill |

## Deliberately excluded

All CF application code and business logic; Tampermonkey metadata and globals;
Sage, DPD, SharePoint, SiteBuilder, Power Apps and Outlook contracts; concrete
routes, endpoints, identifiers, storage keys, hashes, feature flags, customer
data, deployment details, and operational confirmation/retry policies.

The exclusion is semantic, not a string substitution: the harness describes
principles while the project profile owns project-specific authority.
