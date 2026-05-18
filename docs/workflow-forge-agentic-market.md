# Forge Workflow — Agentic Market Integration

**Updated:** 2026-05-17  
**Layer:** Inference fallback (tertiary)

## Inference Fallback Chain

```
1. Primary provider (config) → Varies by model/provider
2. Venice (x402, $0.001-10.00/call) → 15+ models, OpenAI-compatible
```

### When to Use Venice (x402)
- Primary provider rate-limited or unavailable
- Need a specific model not in primary config (e.g., Claude, Gemini, Grok via single API)
- Privacy-focused inference (Venice doesn't store conversations)
- Image/audio/video generation

### Model Selection
```bash
# Chat (cheap, use for most tasks)
POST https://api.venice.ai/api/v1/chat/completions
Model: "claude-sonnet-4" | "gpt-4o" | "deepseek-chat" | ...

# Image generation
POST https://api.venice.ai/api/v1/image/generate
Model: "flux" | "dall-e-3"

# Embeddings
POST https://api.venice.ai/api/v1/embeddings
Model: "text-embedding-3-small"
```

### Cost Controls
- Most chat completions: $0.001-0.01 per call
- Image generation: varies by model/resolution
- Top up $5-10 at a time via `/x402/top-up`
- Budget: ~$1.20/month for Forge fallback usage (light)
