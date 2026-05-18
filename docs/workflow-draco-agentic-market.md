# Draco Workflow — Agentic Market Integration

**Updated:** 2026-05-17  
**Layer:** Primary onchain data via x402

## Onchain Data Fallback Chain

```
1. Allium (x402, $0.01-0.03/call) → Token prices, wallet balances, PnL, transactions, SQL
2. Heurist Mesh → BaseUSDCForensicsAgent ($0.005) → USDC flow analysis, fund sources/sinks
3. Heurist Mesh → EtherscanAgent ($0.01) → Transaction details, token transfers, top holders
4. Heurist Mesh → ZerionWalletAnalysisAgent ($0.005) → NFT/token portfolio
5. Heurist Mesh → DefiLlamaAgent ($0.003) → Protocol metrics, TVL, yield pools
```

### Wallet Screening Workflow
```bash
# Step 1: Quick USDC profile (Allium or Heurist)
bash heurist_query.sh BaseUSDCForensicsAgent usdc_basic_profile '{"address": "0x..."}'

# Step 2: Fund flow analysis
bash heurist_query.sh BaseUSDCForensicsAgent usdc_top_funders '{"address": "0x..."}'
bash heurist_query.sh BaseUSDCForensicsAgent usdc_top_sinks '{"address": "0x..."}'

# Step 3: DeFi context
bash heurist_query.sh DefiLlamaAgent get_protocol_metrics '{"slug": "..."}'
```

### Token Analysis Workflow
```bash
# Current price + history
bash allium_query.sh prices "0x..."
bash allium_query.sh sql "SELECT * FROM token_prices WHERE address = '...'"
```

## Cost Controls
- Allium: $0.01-0.03 per query, batch addresses when possible
- Heurist forensics: $0.005 per call, very affordable
- SQL explorer: $0.01 per query, use for complex analysis
- Budget: ~$13.50/month for moderate Draco usage
