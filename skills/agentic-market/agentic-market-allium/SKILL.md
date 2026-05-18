---
name: agentic-market-allium
description: Query onchain data via Allium's x402 API — token prices, wallet balances, transactions, PnL, and SQL explorer. Use when Draco needs onchain intelligence and no dedicated API key is available.
metadata:
  hermes:
    tags: [agentic-market, x402, onchain, data, draco]
    related_skills: [agentic-market-heurist-mesh]
---

# Agentic Market — Allium Onchain Data

Query onchain data via Allium's x402-payable API. No API key needed — pay per call in USDC on Base.

## Trigger Conditions

Use when:
- Draco needs wallet balance, transaction, or PnL data
- Token price queries (current or historical)
- Onchain SQL exploration is needed
- No dedicated Allium API key is available

## Pricing

| Endpoint | Price (USDC) |
|---|---|
| Token prices | $0.02 |
| Price history/stats | $0.02 |
| Wallet balances | $0.03 |
| Wallet PnL | $0.03 |
| Wallet transactions | $0.03 |
| SQL explorer | $0.01 |

## API Base

```
https://agents.allium.so/api/v1
```

## Authentication

x402 payment protocol. Include payment header in request:

```bash
curl -X POST "https://agents.allium.so/api/v1/developer/prices" \
  -H "Content-Type: application/json" \
  -H "X-Payment: <x402-payment-header>" \
  -d '{"addresses": ["0x..."]}'
```

Or use the `awal` CLI:
```bash
npx awal x402 pay --to agents.allium.so --amount 0.02 --data '{"addresses": ["0x..."]}'
```

## Key Endpoints

### Token Prices (Current)
```bash
POST /developer/prices
Body: { "addresses": ["0x..."] }
```

### Token Price History
```bash
POST /developer/prices/history
Body: { "addresses": ["0x..."], "start_timestamp": "...", "end_timestamp": "...", "time_granularity": "5m" }
```

### Wallet Balances
```bash
POST /developer/wallet/balances
Body: { "addresses": ["0x..."] }
```

### Wallet PnL
```bash
POST /developer/wallet/pnl
Body: { "addresses": ["0x..."] }
```

### Wallet Transactions
```bash
POST /developer/wallet/transactions
Body: { "addresses": ["0x..."] }
```

### SQL Explorer (Async)
```bash
POST /explorer/queries/run-async
Body: { "sql": "SELECT ...", "parameters": {} }
# Returns job_id → poll for results
```

## Wrapper Script

Use `scripts/allium_query.sh` for standard queries:

```bash
bash scripts/allium_query.sh prices "0x..."
bash scripts/allium_query.sh balances "0x..."
bash scripts/allium_query.sh pnl "0x..."
bash scripts/allium_query.sh sql "SELECT * FROM ..."
```

## Notes

- Allium covers major EVM chains
- SQL explorer requires async polling (submit → wait → fetch)
- For complex multi-wallet analysis, batch addresses in single request
- Fallback: Heurist Mesh has complementary onchain agents (EtherscanAgent, ZerionWalletAnalysisAgent)
