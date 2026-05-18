# Agentic Wallet Setup — Blocker Document

## Status: ⏸️ BLOCKED — Human Action Required

Agentic Wallet creation requires interactive steps that cannot be automated:

## What's Needed

1. **Coinbase Account** — Does Israel have one? If yes:
   - Run: `npx awal auth login <email>`
   - Check email for 6-digit OTP
   - Run: `npx awal auth verify <flowId> <otp>`

2. **USDC Funding** — Via Coinbase Onramp (browser required):
   - Log into Coinbase → Buy USDC on Base network
   - Minimum ~$10-20 for testing

3. **Spending Limits** — Recommended:
   - Per call: $0.05 USDC
   - Per session: $5.00 USDC

## Alternative Path

If no Coinbase account exists, we can use the Agentic.Market API directly via HTTP (read-only discovery) without a wallet. Payment-required endpoints will still need a wallet.

## Discovery API (No Auth Required)

```bash
# List all services
curl -s "https://agentic.market/v1/services" | python3 -m json.tool

# Search specific services
curl -s "https://agentic.market/v1/services/search?q=exa" | python3 -m json.tool
curl -s "https://agentic.market/v1/services/search?q=firecrawl" | python3 -m json.tool
```

## Next Steps

- Israel confirms Coinbase account status
- If yes: schedule 5-minute wallet setup
- If no: create Coinbase account first
- Meanwhile: proceed with service audit using public APIs

## Tracking

Issue: IAMGODIAM/e5-agent-control-room#1
