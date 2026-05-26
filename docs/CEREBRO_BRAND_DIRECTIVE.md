# CEREBRO — Brand Directive + Fact Schema v1
**DAG:** cerebro-brand-directive-2026-0526
**Filed:** 2026-05-26 | **Authority:** Chairman Israel Lee Armstead
**Enforced by:** Sue + Hermie + Forge

---

## Brand Directive

CEREBRO is the canonical, sovereign name for the IAMGODIAM institutional memory and trust-scored fact store system. This name is final and not subject to revision.

**Applies to:**
- All agent-facing documentation, runbooks, and plans
- All Base44 entities, functions, and context dispatch endpoints
- All Hallways configuration, code, and API responses
- All hermes-workspace plans, soul files, and work registries
- All board communications, GitHub issues, and relay messages
- All external tool wrappers — no upstream vendor name bleeds into board surfaces

**Any tool or library that uses a different internal name MUST be wrapped or aliased as CEREBRO in all IAMGODIAM-facing interfaces.**

---

## CEREBRO Fact Schema v1

Each fact in the CEREBRO trust store carries the following fields:

```json
{
  "claim_id": "cerebro-{dag_stamp}-{sequence}",
  "claim": "Plain language statement of fact",
  "category": "operational | strategic | provisional | doctrine",
  "trust_score": 0.00,
  "sessions_survived": 0,
  "external_confirmed": false,
  "confirming_agent": "",
  "dag_origin": "",
  "source_artifact": "",
  "promoted_at": "ISO-8601",
  "last_validated": "ISO-8601",
  "promoting_agent": "",
  "status": "active | deprecated | contradicted"
}
```

**Trust score thresholds:**
- `0.95+` → Auto-promote to doctrine. No review required.
- `0.85–0.94` → Auto-promote to CEREBRO. MiroFish-reviewed.
- `0.75–0.84` → Queue for board review.
- `< 0.75` → Provisional. Re-evaluate after next session.

**Schema lock:** This schema is approved for Hermie, Sue (Base44), and relay writes.
No agent may write to CEREBRO with a non-compliant payload.

---

## Integration Points

| System | CEREBRO Role | Endpoint / Key |
|---|---|---|
| Hallways context dispatch | Provides CEREBRO packet to agents on session start | `/functions/hallwaysContext` |
| BOARD_MEMORY KV | KV-backed CEREBRO store for agent reads | Key prefix: `cerebro:fact:{claim_id}` |
| Base44 WikiEntry entity | Human-readable CEREBRO corpus | `category: "cerebro"` |
| Hermes Dreaming loop | Writes new claims post-session | `.hermes/artifacts/` → promotion |
| MiroFish | Scores claims before promotion | Confidence ≥ 75% required |

---

*DAG: cerebro-brand-directive-2026-0526*
*Filed by Sue · Chief of Staff · IAMGODIAM*
