# EVIDENCE LEDGER
> Reconciling internal authenticated evidence vs public discoverability
> Filed: 2026-05-26 | DAG: evidence-ledger-2026-0526 | Author: Sue + Wyrmcore

## Evidence Classification
- `authenticated-confirmed` — verified via GitHub API or Drive connector with auth token
- `drive-confirmed` — found in Google Drive with authenticated access
- `public-confirmed` — independently visible on public internet without auth
- `inferred` — derived from confirmed evidence, not directly observed
- `unknown` — insufficient evidence to classify

---

## Repo Status

| Repository | Status | Evidence | Public? | Notes |
|---|---|---|---|---|
| `e5-agent-control-room` | Active — control plane | authenticated-confirmed | ✅ Public | 33 files, docs, agent registry |
| `hallways-boardroom` | Active — major subsystem | authenticated-confirmed | ❌ Private | Boardroom on :8420, Relay on :8421 |
| `hermes-workspace` | Active — Hermie ops | authenticated-confirmed | ❌ Private | Block queue, run summaries, decision log |
| `e5-website` | Active — public site | public-confirmed | ✅ Public | e5enclave.com · Eleventy/GitHub Pages |
| `IAMGODIAM` | Active — profile README | public-confirmed | ✅ Public | Ecosystem declaration |
| `e5-agentic-services` | Active | authenticated-confirmed | ✅ Public | MCP endpoints |
| `agentstore` | Active | authenticated-confirmed | ✅ Public | Agent marketplace |
| `iamgodiam-mesh` | Active | authenticated-confirmed | ✅ Public | Mesh infrastructure |
| `bdi-raw-data-vault` | Active | authenticated-confirmed | ✅ Public | CC0 research data |
| `bdi-sovereign-dataset` | Active | authenticated-confirmed | ✅ Public | CC0 research data |
| `farmblock-data` | Active | authenticated-confirmed | ✅ Public | CC0 |
| `farmblock-dataset` | Active | authenticated-confirmed | ✅ Public | CC0 |
| `nohumanops-site` | Deprecated | authenticated-confirmed | ✅ Public | Archive candidate |
| `zero-human-business-landing` | Deprecated | authenticated-confirmed | ✅ Public | Archive candidate |
| `AgenticParadise`/`agentic-paradise` | Overlap/duplicate | inferred | unknown | Consolidate with control-room |
| `hermes-governance` | Merged | inferred | unknown | Verify merge, then archive |
| `hermie-governance-backup` | Merge pending | inferred | unknown | Verify before archive |
| Forks (n8n, AppFlowy, ollama, etc.) | Sovereign tools | authenticated-confirmed | ✅ Public | Archive or tag as sovereign-forks |

## Public Surface Gap (Claude finding — confirmed)
Claude's public-surface audit found ZERO public evidence of IAMGODIAM/E5 as a discoverable ecosystem.
This is NOT an internal reality gap — it is a **public legibility gap**.

### What outside auditors, funders, and collaborators cannot find today:
- No searchable documentation of the IAMGODIAM ecosystem
- No public agent registry (sanitized)
- No architecture one-pager at a public URL
- No canonical "what is IAMGODIAM" landing page indexed by Google
- No press mentions, blog posts, or third-party references
- GitHub org profile exists but is not linked from e5enclave.com

### What this means:
For grants, partnerships, and enterprise adoption — we look invisible.
The system is real. The public cannot verify it. That is the sprint.

## Credentials Status
| Credential | Status | Action |
|---|---|---|
| Splunk admin password `E5enclave2026!` | ⚠️ WAS EXPOSED in registry.md (PUBLIC repo) | ROTATE IMMEDIATELY on MC |
| Boardroom auth token | Was referenced in registry.md | Scrubbed — stored in env only |
| API keys in `~/.hermes/.env` | Secure | Confirm not in any public file |

## Next: Stabilization Sprint Gates
- [ ] Splunk credential rotated (human task — MC)
- [ ] Webhook fail-open patched in hallways-boardroom
- [ ] Hallways ADR filed (runtime boundary decision)
- [ ] CI/CD paths corrected
- [ ] REPO_REGISTRY.md created
- [ ] PUBLIC_SURFACE_GAP_MAP.md created
- [ ] DISCLOSURE_POLICY.md drafted
