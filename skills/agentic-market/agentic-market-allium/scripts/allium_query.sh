#!/bin/bash
# Allium Onchain Data Query Script
# Usage: bash allium_query.sh <command> <address>
# Commands: prices, balances, pnl, transactions, sql

set -euo pipefail

COMMAND="${1:?Usage: allium_query.sh <prices|balances|pnl|transactions|sql> <address>}"
ADDRESS="${2:?Usage: allium_query.sh <command> <address>}"
AWAL="${AWAL:-npx awal}"

case "$COMMAND" in
  prices)
    $AWAL x402 pay --to agents.allium.so --amount 0.02 --path "/api/v1/developer/prices" --method POST --body "{\"addresses\": [\"$ADDRESS\"]}" ;;
  balances)
    $AWAL x402 pay --to agents.allium.so --amount 0.03 --path "/api/v1/developer/wallet/balances" --method POST --body "{\"addresses\": [\"$ADDRESS\"]}" ;;
  pnl)
    $AWAL x402 pay --to agents.allium.so --amount 0.03 --path "/api/v1/developer/wallet/pnl" --method POST --body "{\"addresses\": [\"$ADDRESS\"]}" ;;
  transactions)
    $AWAL x402 pay --to agents.allium.so --amount 0.03 --path "/api/v1/developer/wallet/transactions" --method POST --body "{\"addresses\": [\"$ADDRESS\"]}" ;;
  sql)
    SQL="${3:?Usage: allium_query.sh sql <address> <query>}"
    $AWAL x402 pay --to agents.allium.so --amount 0.01 --path "/api/v1/explorer/queries/run-async" --method POST --body "{\"sql\": \"$SQL\", \"parameters\": {}}" ;;
  *) echo "Unknown: $COMMAND"; exit 1 ;;
esac
