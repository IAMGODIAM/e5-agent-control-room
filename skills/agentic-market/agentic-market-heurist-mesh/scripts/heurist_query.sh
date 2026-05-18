#!/bin/bash
# Heurist Mesh Agent Query Script
# Usage: bash heurist_query.sh <agent> <function> [body_json]

set -euo pipefail

AGENT="${1:?Usage: heurist_query.sh <agent> <function> [body_json]}"
FUNCTION="${2:?Usage: heurist_query.sh <agent> <function> [body_json]}"
BODY="${3:-{}}"
AWAL="${AWAL:-npx awal}"
BASE="https://mesh.heurist.xyz/x402/agents"

get_price() {
  case "$AGENT/$FUNCTION" in
    */get_market_summary|*/get_trending_tokens|*/get_web3_news|*/search_projects|*/ask_heurist|*/check_job_status) echo "0.001" ;;
    */usdc_basic_profile|*/usdc_daily_activity|*/usdc_hourly_pair_activity|*/usdc_net_counterparties|*/usdc_top_funders|*/usdc_top_sinks|*/get_address_labels|*/fetch_wallet_nfts|*/fetch_wallet_tokens|*/exa_scrape_url) echo "0.005" ;;
    */get_chain_metrics|*/get_protocol_metrics|*/search_yield_pools|*/macro_regime_context|*/macro_release_calendar|*/token_profile|*/token_search|*/get_research_result) echo "0.003" ;;
    */search_account|*/search_mentions|*/tweet_detail|*/twitter_search|*/user_timeline|*/get_transaction_details|*/get_erc20_token_transfers|*/get_erc20_top_holders|*/get_recent_large_trades|*/query_latest_graduated_tokens|*/query_recent_token_creation|*/analyze_base_wallet|*/analyze_ethereum_wallet|*/ask_health_advice) echo "0.01" ;;
    */caesar_research) echo "0.10" ;;
    */image_to_video*) echo "0.15" ;;
    */text_to_video*) echo "0.15" ;;
    */image_to_video_with_audio*|*/text_to_video_with_audio*) echo "0.25" ;;
    *) echo "0.005" ;;
  esac
}

PRICE=$(get_price)
$AWAL x402 pay --to mesh.heurist.xyz --amount "$PRICE" --path "/x402/agents/$AGENT/$FUNCTION" --method POST --body "$BODY"
