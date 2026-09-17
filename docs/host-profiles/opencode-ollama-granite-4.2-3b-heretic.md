# Host profile: OpenCode + Ollama + Granite 4.2 3B Heretic

**Status:** `CANDIDATE` / `EXPERIMENTAL`.

This is an isolated host recipe for a local OpenCode deployment. It is not
part of the portable repository harness and it does not install, supervise or
rewrite OpenCode, Ollama, Windows, drivers or models.

## Runtime boundary

```text
OpenCode (persistent / attached)
    -> Ollama
        -> hf.co/mradermacher/granite-4.2-3b-Heretic-GGUF:Q4_K_M
```

The model identifier is an exact runtime contract. Do not silently substitute
another Granite or Qwen variant. Availability, current load and request
transport remain host facts and must be read back during host evaluation.

## Desired recipe

| Field | Target | Truthfulness |
|---|---:|---|
| Primary agent | `granite-deep` | Declared by this profile; live OpenCode readback required. |
| Model | `hf.co/mradermacher/granite-4.2-3b-Heretic-GGUF:Q4_K_M` | Declared exact ID; live readback required. |
| Quantization | `Q4_K_M` | Declared by model ID; verify with host tooling. |
| Context | `16384` | Target; verify OpenCode request and `ollama ps`. |
| Max output | `4096` | Target; verify effective provider request. |
| Temperature | `1.0` | Required Granite sampling target. |
| Top-p | `0.95` | Required Granite sampling target. |
| Flash Attention | `ON` | Host setting; do not infer from model name. |
| KV cache | `q8_0` | Host setting; verify readback. |
| Parallel | `1` | Host setting; verify readback. |
| Tool calling | `ENABLED` | Declared capability; useful behavior requires host evidence. |
| MCP default | `OFF` | Required; preserve configured definitions without activation. |
| Title agent | `OFF` | Required; verify effective OpenCode schema. |
| GPU target | `100% GPU` | Target only; verify `ollama ps` and GPU telemetry. |
| Swap/pagefile | Automatic fallback only | Windows/host policy, not controlled here. |

The existing FAST contract is external and protected:
`hf.co/kaineone/Qwen3.5-4B-abliterated-GGUF:Q4_K_M`. This profile does not
rename, replace, tune or claim simultaneous residency for FAST.

## Thinking truthfulness

The agent requests `FULL` thinking only through a schema/provider mechanism
that is actually supported. Record these fields separately:

```text
THINKING_REQUESTED: FULL
THINKING_OBSERVED: FULL | PARTIAL | NONE | UNKNOWN
THINKING_TRANSPORT: PRESERVES | TRANSFORMS | DROPS | UNKNOWN
THINKING_TELEMETRY: VERIFIED | UNKNOWN
```

Visible `<think>` text, a UI label or a model capability declaration alone is
not proof of full reasoning transport.

## Tool and network boundary

The minimum local surface is `READ`, `SEARCH`, `GREP`, `GLOB`, `LIST`, `EDIT`,
`SHELL` and `TEST`, with writes owned by one explicit `WRITE_OWNER`. Chrome,
browser, GitHub, web search, external network, subagents and unnecessary MCPs
are disabled by default. Network and external writes are `DENY` or an explicit
human gate; never implicit `ALLOW`.

See [`granite-deep.agent.md`](granite-deep.agent.md), the portable
[`capability contract`](../CAPABILITY_CONTRACT.md) and the
[`host evaluations`](opencode-ollama-granite-4.2-3b-heretic.evals.md).

## Loading order

```text
portable CORE
-> this host profile
-> granite-deep agent profile
-> current task capsule
-> only relevant Skill/workflow
-> host eval needed for the claim
```

Do not load the whole toolkit or project context by default. Project-specific
observations may inform this profile but must not be promoted into portable
core rules without cross-project evidence.
