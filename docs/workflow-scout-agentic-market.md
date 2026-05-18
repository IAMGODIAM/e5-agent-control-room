# Scout Workflow — Agentic Market Integration

**Updated:** 2026-05-17  
**Layer:** Secondary data sources (fallback chain)

## Search Fallback Chain

```
1. web_search (built-in) → Fast, free, general purpose
2. web_extract (built-in) → URL content extraction, free
3. Exa (x402, $0.007/call) → AI-powered search, cited results
4. Heurist Mesh → ExaSearchDigestAgent proxy ($0.005) or FirecrawlSearchDigestAgent ($0.01)
```

### When to Use Exa (x402)
- Deep research requiring cited sources
- Fact-checking with LLM-ready content
- URL content extraction (batch up to 5 URLs)

### When to Use Heurist Mesh (x402)
- Twitter sentiment + trending tokens (ElfaTwitterIntelligenceAgent)
- Market-wide news summary (AIXBTProjectInfoAgent)
- Deep async research (CaesarResearchAgent, $0.10)

## Cost Controls
- Default to free tools (web_search, web_extract)
- Use Exa only when search quality matters more than cost
- Use Heurist for specialized intel (Twitter, research)
- Budget: ~$7.50/month for moderate Scout usage
