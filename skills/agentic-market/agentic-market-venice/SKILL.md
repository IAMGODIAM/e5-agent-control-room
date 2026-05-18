---
name: agentic-market-venice
description: Access 15+ AI models via Venice's x402 API — OpenAI-compatible chat, image/audio/video generation, embeddings. Privacy-focused. Use as Forge's inference fallback when primary providers are unavailable.
metadata:
  hermes:
    tags: [agentic-market, x402, inference, ai, forge]
    related-skills: [agentic-market-allium]
---

# Agentic Market — Venice AI Inference

Access 15+ AI models via Venice's x402-payable API. OpenAI-compatible. Privacy-focused. No API key needed — pay per call in USDC on Base.

## Trigger Conditions

Use when:
- Forge needs inference fallback (primary provider unavailable)
- Multi-model access needed via single endpoint
- Image/audio/video generation required
- Privacy-focused inference is preferred
- No dedicated API key for a specific model provider

## Pricing

| Endpoint | Price Range (USDC) |
|---|---|
| Chat completions | $0.001–10.00 (model-dependent) |
| Embeddings | $0.001–10.00 |
| Image generation | $0.001–10.00 |
| Audio (TTS/transcription) | $0.001–10.00 |
| Video generation | $0.001–10.00 |

**Note:** Most lightweight tasks cost $0.001–0.01. Heavy tasks (long context, video) cost more.

## API Base

```
https://api.venice.ai/api/v1
```

## Models Available

Venice hosts models from: OpenAI, Anthropic (Claude), Google Gemini, xAI (Grok), DeepSeek, Mistral, Qwen, GLM, Llama, Kimi, and more.

## Authentication

x402 payment via top-up endpoint:

```bash
# Top up credits (one-time or as needed)
POST /x402/top-up
Body: { "amount": "5.00" }
# Returns payment instructions → complete via x402 flow
```

Or include payment header per request:
```bash
curl -X POST "https://api.venice.ai/api/v1/chat/completions" \
  -H "Content-Type: application/json" \
  -H "X-Payment: <x402-payment-header>" \
  -d '{"model": "claude-sonnet-4", "messages": [...]}'
```

## Key Endpoints

### Chat Completions (OpenAI-Compatible)
```bash
POST /chat/completions
Body: {
  "model": "claude-sonnet-4",
  "messages": [{"role": "user", "content": "..."}],
  "max_tokens": 1000
}
```

### Image Generation
```bash
POST /image/generate
Body: {
  "prompt": "A futuristic city at sunset",
  "model": "flux",
  "width": 1024,
  "height": 1024
}
```

### Text-to-Speech
```bash
POST /audio/speech
Body: {
  "input": "Hello, this is a test.",
  "voice": "alloy",
  "model": "tts-1"
}
```

### Embeddings
```bash
POST /embeddings
Body: {
  "input": "Text to embed",
  "model": "text-embedding-3-small"
}
```

## Drop-in OpenAI Replacement

For any OpenAI-compatible code, just change the base URL:

```python
# Before
client = OpenAI(api_key="sk-...")

# After (Venice via x402)
client = OpenAI(
    base_url="https://api.venice.ai/api/v1",
    api_key="x402"  # Payment via X-Payment header
)
```

## Notes

- Venice is privacy-focused — doesn't store conversation history
- Model availability may vary; check `/models` endpoint
- For production use, top up $5-10 at a time to minimize payment overhead
- Fallback chain: Primary provider → Venice (x402) → Heurist Mesh agents
