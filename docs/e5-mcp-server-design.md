# E5 MCP Server — Design Document

**Status:** Design phase (Phase 3 scoping)  
**Date:** 2026-05-17  
**Author:** Hermie (Visionary Layer)  
**Tracking:** IAMGODIAM/e5-agent-control-room#1

---

## Vision

Expose E5 Enclave's agent capabilities as consumable, pay-per-call services on AgenticMarket.dev (MCP) and Agentic.Market (x402). Other AI agents pay USDC to access E5's research, verification, and intelligence capabilities.

---

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     E5 MCP Server                            │
│                                                              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐  │
│  │  Research     │  │ Verification │  │  Onchain Intel   │  │
│  │  Service      │  │ Service      │  │  Service         │  │
│  │              │  │              │  │                  │  │
│  │ - Due dil.   │  │ - 501(c)(3)  │  │ - Wallet screen  │  │
│  │ - Market     │  │ - Entity     │  │ - Token analysis │  │
│  │   analysis   │  │   validation │  │ - Risk scoring   │  │
│  │ - Competitive│  │ - People     │  │                  │  │
│  │   intel      │  │   search     │  │                  │  │
│  └──────┬───────┘  └──────┬───────┘  └────────┬─────────┘  │
│         │                 │                    │             │
│  ┌──────▼─────────────────▼────────────────────▼─────────┐  │
│  │              MCP Tool Router                           │  │
│  │  - tools/list → enumerates available tools             │  │
│  │  - tools/call → routes to correct service             │  │
│  └──────────────────────┬────────────────────────────────┘  │
│                         │                                    │
│  ┌──────────────────────▼────────────────────────────────┐  │
│  │              x402 Payment Layer                        │  │
│  │  - Verify payment before processing                   │  │
│  │  - Settle USDC on Base network                        │  │
│  │  - Receipt generation                                 │  │
│  └──────────────────────┬────────────────────────────────┘  │
│                         │                                    │
└─────────────────────────┼────────────────────────────────────┘
                          │
                    HTTPS (public)
                          │
              ┌───────────▼───────────┐
              │   AgenticMarket.dev   │
              │   (MCP Marketplace)   │
              │   + Agentic.Market    │
              │   (x402 Directory)    │
              └───────────────────────┘
```

---

## Service Definitions

### 1. E5 Research Report

**Tool name:** `e5_research_report`  
**Description:** Generate structured due diligence reports on crypto projects, tokens, or wallets  
**Price:** $0.10–0.50 USDC (depth-dependent)

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "subject": { "type": "string", "description": "Project name, token symbol, or wallet address" },
    "type": { "type": "string", "enum": ["project", "token", "wallet"], "description": "Type of subject" },
    "depth": { "type": "string", "enum": ["quick", "standard", "deep"], "description": "Report depth" },
    "focus_areas": { "type": "array", "items": {"type": "string"}, "description": "Optional: tokenomics, team, risks, competitors" }
  },
  "required": ["subject", "type"]
}
```

**Output:** Structured markdown report with sections: Overview, Tokenomics, Team, Risks, Competitors, Verdict.

---

### 2. Nonprofit Verification

**Tool name:** `e5_verify_nonprofit`  
**Description:** Verify US nonprofit/501(c)(3) status using ProPublica + IRS data  
**Price:** $0.05 USDC

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "name": { "type": "string", "description": "Organization name" },
    "ein": { "type": "string", "description": "EIN (optional)" },
    "state": { "type": "string", "description": "State (optional)" }
  },
  "required": ["name"]
}
```

**Output:** JSON with fields: `is_nonprofit`, `ein`, `name`, `city`, `state`, `ntee_code`, `ruling_year`, `source`.

---

### 3. Entity Validation

**Tool name:** `e5_validate_entity`  
**Description:** Enrich and validate company or person data  
**Price:** $0.05–0.10 USDC

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "query": { "type": "string", "description": "Company name, domain, or person name" },
    "type": { "type": "string", "enum": ["company", "person"] }
  },
  "required": ["query", "type"]
}
```

**Output:** Enriched entity profile with domain, industry, size, location, social links.

---

### 4. Onchain Wallet Screen

**Tool name:** `e5_wallet_screen`  
**Description:** Risk score a wallet address for sanctions, darknet, mixing exposure  
**Price:** $0.10–0.25 USDC

**Input Schema:**
```json
{
  "type": "object",
  "properties": {
    "address": { "type": "string", "description": "EVM wallet address (0x...)" },
    "chains": { "type": "array", "items": {"type": "string"}, "description": "Chains to check (default: all)" }
  },
  "required": ["address"]
}
```

**Output:** JSON with fields: `risk_score` (0-100), `risk_level` (low/medium/high/critical), `flags` (array), `top_counterparties`, `usdc_flow_summary`.

---

## Technical Stack

| Component | Technology | Rationale |
|---|---|---|
| **Runtime** | Python 3.12 + FastMCP | Native MCP support, async, fast |
| **Hosting** | Cloudflare Workers or Railway | Public HTTPS, auto-scaling, low cost |
| **Payment** | x402 facilitator (Coinbase) | Standard protocol, USDC on Base |
| **Data sources** | ProPublica, IRS, Allium, Heurist Mesh | Existing x402 services we already evaluated |
| **Auth** | x402 payment verification | No API keys needed by consumers |

---

## Deployment Plan

### Step 1: Scaffold (this repo)
- [x] Repo initialized: `IAMGODIAM/e5-agentic-services`
- [ ] Add `pyproject.toml` with FastMCP dependency
- [ ] Create `src/e5_mcp_server.py` with tool router
- [ ] Implement 4 tools (stub → real)

### Step 2: x402 Integration
- [ ] Add payment verification middleware
- [ ] Configure USDC receipt wallet (Base)
- [ ] Set pricing per tool call
- [ ] Generate receipts

### Step 3: Deploy
- [ ] Deploy to Cloudflare Workers (or Railway)
- [ ] Verify public HTTPS endpoint
- [ ] Test MCP handshake

### Step 4: Publish
- [ ] Submit to AgenticMarket.dev (target Founding Creator)
- [ ] Register on Agentic.Market (x402 directory)
- [ ] Monitor usage + earnings

---

## Revenue Projections

### Conservative (Month 1-3)
- 100 calls/day × $0.10 avg = $10/day = **$300/month**
- AgenticMarket.dev takes 10-20% → **$240-270 net**

### Moderate (Month 4-6)
- 500 calls/day × $0.10 avg = $50/day = **$1,500/month**
- Net: **$1,200-1,350**

### Revenue Split
- 80% to E5 (standard) or 90% (Founding Creator)
- 10-20% to AgenticMarket.dev platform

---

## Open Questions

1. **Legal:** Is agent-generated revenue compatible with 501(c)(3)? Need legal review.
2. **Pricing:** Should we start free (loss leader) or paid from day one?
3. **Founding Creator:** Is the 90% program still open? (First 100 approved creators)
4. **EDEN overlap:** How does Sue's EDEN deployment affect this? Potential integration vs. competition.
5. **Wallet:** Need Agentic Wallet funded with USDC to receive payments.

---

## Deferred (Post-150 Turns)

- [ ] Full MCP server implementation
- [ ] x402 payment integration
- [ ] Cloud deployment
- [ ] AgenticMarket.dev submission
- [ ] Agentic.Market x402 registration
- [ ] Revenue tracking dashboard
- [ ] Legal review of 501(c)(3) revenue model

---

*Next phase begins when Israel says "execute Phase 3" or similar trigger.*
