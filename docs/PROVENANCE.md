# Artifact and validation provenance

**Status:** `EXPERIMENTAL`.

Provenance makes a claim reproducible without treating an old transcript as
current truth. It applies to toolkit files, project artifacts, validation runs
and host observations.

## Artifact identity

For each material artifact or configuration snapshot record, when available:

- `artifact_id`: stable name or path plus purpose;
- `artifact_hash`: practical content hash, or `UNKNOWN` when unavailable;
- `producer`: human, agent, tool or host component;
- `source_path` / `source_revision`: where it came from;
- `created_at`: timestamp with timezone;
- `scope`: repository, project, host or runtime boundary;
- `status`: `CANDIDATE`, `CURRENT`, `STALE`, `REJECTED` or `UNKNOWN`.

## Validation record

Every material validation claim should include:

| Field | Example / rule |
|---|---|
| `validation_id` | Human-readable run identifier. |
| `artifact_id` and `artifact_hash` | The exact input being validated. |
| `validator` | Script, command or human procedure. |
| `validator_version` | Version or hash when available. |
| `command` | Exact command, with secrets redacted. |
| `result` | `PASS`, `FAIL`, `PARTIAL`, `NOT_RUN` or `UNKNOWN`. |
| `started_at` / `finished_at` | Timestamp with timezone. |
| `environment` | OS, runtime, host and relevant profile; no secrets. |
| `evidence` | Output summary, counts, paths or readback. |
| `limitations` | What the check did not prove. |
| `revalidation_trigger` | Source, config, environment or contract change that invalidates it. |

Do not use bare `VALIDATED` as a durable state. Use `PASS` only with the
associated record, and mark it `STALE` after a relevant input changes.

## Evidence levels

Keep `LOCAL`, `SYNTHETIC`, `INTEGRATION` and `LIVE` evidence distinct. A local
structural validator does not prove runtime behavior; a live observation does
not prove portability. Unknown or incomplete evidence remains unknown.
