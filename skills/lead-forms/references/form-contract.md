# Lead form contract

Define this contract before connecting a form to a destination.

## Field contract

For each field record its purpose, type, requiredness, length limits, normalised
value, error message, and whether it contains personal data. Reject unknown or
unexpected fields on the server.

## State contract

The UI must distinguish idle, submitting, success, validation error, and server
error. Errors should be attached to fields and summarised in a way that works
with keyboard and screen-reader navigation. Never clear useful user input after
an ordinary validation error without a reason.

## Adapter contract

Keep the form independent from delivery:

```text
validated form data -> authorised lead adapter -> result
```

The adapter must define success, retry/unknown, and failure semantics without
logging raw personal data or exposing credentials to client code. Email, CRM,
database, and API adapters are separate integrations, not defaults.
