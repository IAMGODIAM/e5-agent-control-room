---
name: agentic-market-heurist-mesh
description: Access 60+ specialized AI agents via Heurist Mesh x402 API — Twitter intel, wallet forensics, DeFi analysis, deep research, web search, video generation. Use for multi-intel gathering when no dedicated API keys are available.
metadata:
  hermes:
    tags: [agentic-market, x402, multi-agent, intel, draco, scout]
    related_skills: [agentic-market-allium, agentic-market-exa]
---

# Agentic Market — Heurist Mesh Multi-Agent Platform

Access 60+ specialized AI agents via Heurist Mesh's x402-payable API. No API key needed — pay per call in USDC on Base/Solana.

## Trigger Conditions

Use when:
- Draco needs wallet forensics, fund flow analysis, or NFT/token holdings
- Scout needs Twitter sentiment, trending tokens, or deep research
- Forge needs video generation (Wan 2.2/2.5)
- Multi-source intelligence gathering is needed
- No dedicated API keys for individual services

## Pricing

| Agent Category | Price Range (USDC) |
|---|---|
| Market intel, trending tokens | $0.001–0.01 |
| Twitter/social analysis | $0.01 |
| Wallet forensics (USDC flow) | $0.005 |
| DeFi protocol analysis | $0.003 |
| Deep research (Caesar) | $0.10 (async) |
| Web search (Exa/Firecrawl proxy) | $0.005–0.01 |
| Video generation (Wan) | $0.001–0.25 |
| SEC filings | $0.002 |
| Macro/finance data | $0.002–0.003 |

## API Base

```
https://mesh.heurist.xyz/x402/agents/
```

## Authentication

x402 payment protocol. Include payment header:

```bash
curl -X POST "https://mesh.heurist.xyz/x402/agents/AIXBTProjectInfoAgent/get_market_summary" \
  -H "Content-Type: application/json" \
  -H "X-Payment: <x402-payment-header>" \
  -d '{}'
```

Or use `awal` CLI:
```bash
npx awal x402 pay --to mesh.heurist.xyz --amount 0.01 --path "/x402/agents/ElfaTwitterIntelligenceAgent/get_trending_tokens"
```

## Priority Agents (Start Here)

### 1. Wallet Screening — BaseUSDCForensicsAgent
```bash
# Quick wallet profile
POST /agents/BaseUSDCForensicsAgent/usdc_basic_profile
Body: { "address": "0x..." }
# Returns: first/last seen, transfer count, net flow

# Fund flow analysis
POST /agents/BaseUSDCForensicsAgent/usdc_top_funders
POST /agents/BaseUSDCForensicsAgent/usdc_top_sinks
# Returns: top counterparties by volume
```

### 2. Twitter Intel — ElfaTwitterIntelligenceAgent
```bash
# Trending tokens on Twitter
POST /agents/ElfaTwitterIntelligenceAgent/get_trending_tokens
Body: {}

# Search token mentions
POST /agents/ElfaTwitterIntelligenceAgent/search_mentions
Body: { "keywords": ["bitcoin", "ethereum"] }
```

### 3. DeFi Analysis — DefiLlamaAgent
```bash
# Protocol metrics
POST /agents/DefiLlamaAgent/get_protocol_metrics
Body: { "slug": "aave" }

# Yield pools
POST /agents/DefiLlamaAgent/search_yield_pools
Body: { "chains": ["ethereum"], "min_apy": 5 }
```

### 4. Deep Research — CaesarResearchAgent
```bash
# Submit research job (async)
POST /agents/CaesarResearchAgent/caesar_research
Body: { "query": "Analyze the competitive landscape of L2 rollups" }
# Returns: research_id

# Fetch result
POST /agents/CaesarResearchAgent/get_research_result
Body: { "research_id": "..." }
```

### 5. Web Search — ExaSearchDigestAgent
```bash
# Search
POST /agents/ExaSearchDigestAgent/exa_web_search
Body: { "query": "latest crypto regulation news", "time_filter": "qdr:w" }

# Scrape URL
POST /agents/ExaSearchDigestAgent/exa_scrape_url
Body: { "urls": ["https://example.com"] }
```

## Full Agent Catalog

See `references/agent-catalog.md` for all 60+ agents with descriptions and pricing.

## Notes

- Heurist Mesh is a 1P (first-party) integration — direct from Heurist
- Some agents are async (research, video gen) — submit job → poll for results
- For wallet analysis, combine with Allium for comprehensive coverage
- Video generation agents (Wan) are expensive ($0.10–0.25) but high quality
- SEC filing agents are unique — no other x402 service offers this
