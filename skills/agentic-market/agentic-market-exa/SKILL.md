---
name: agentic-market-exa
description: AI-powered web search and content retrieval via Exa's x402 API. Superior to raw web scraping for research. Use as Scout's secondary search layer for deep research and URL content extraction.
metadata:
  hermes:
    tags: [agentic-market, x402, search, research, scout]
    related_skills: [agentic-market-heurist-mesh]
---

# Agentic Market — Exa AI Search

AI-powered web search and content retrieval via Exa's x402-payable API. Superior to raw web scraping for research tasks. No API key needed — pay per call in USDC on Base.

## Trigger Conditions

Use when:
- Scout needs enhanced web search (beyond basic web_search)
- URL content extraction is needed
- Deep research with cited sources is required
- Fact-finding with LLM-ready content is needed
- No dedicated Exa API key is available

## Pricing

| Endpoint | Price (USDC) |
|---|---|
| Content retrieval (by URL) | $0.001 |
| Web search (auto/fast) | $0.007 |
| Web search (deep/deep-reasoning) | $0.007–0.015 |

## API Base

```
https://api.exa.ai
```

## Authentication

x402 payment protocol:

```bash
curl -X POST "https://api.exa.ai/search" \
  -H "Content-Type: application/json" \
  -H "X-Payment: <x402-payment-header>" \
  -d '{"query": "latest AI agent frameworks", "type": "auto", "numResults": 10}'
```

Or use `awal` CLI:
```bash
npx awal x402 pay --to api.exa.ai --amount 0.007 --path "/search" --data '{"query": "..."}'
```

## Key Endpoints

### Web Search
```bash
POST /search
Body: {
  "query": "latest developments in AI agent protocols",
  "type": "auto",         # auto | fast | deep | deep-lite | deep-reasoning
  "numResults": 10,
  "text": true            # Include full text in results
}
```

### Content Retrieval by URL
```bash
POST /contents
Body: {
  "urls": ["https://example.com/article"],
  "text": true
}
```

### Content Retrieval by Document ID
```bash
POST /contents
Body: {
  "ids": ["doc-id-from-search"],
  "text": true
}
```

## Search Types

| Type | Speed | Depth | Cost | Best For |
|---|---|---|---|---|
| `auto` | Fast | Medium | $0.007 | General research |
| `fast` | Fastest | Low | $0.007 | Quick lookups |
| `deep` | Slow | High | $0.015 | Comprehensive research |
| `deep-lite` | Medium | Medium-High | $0.010 | Balanced |
| `deep-reasoning` | Slowest | Highest | $0.015 | Complex analysis |

## Notes

- Exa returns LLM-ready content, not raw HTML
- Results include citations and source URLs
- For batch URL extraction, include up to 5 URLs per request
- Fallback: Heurist Mesh's ExaSearchDigestAgent provides similar functionality via proxy
- For heavy usage, consider direct Exa API key for better rate limits
