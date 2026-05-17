# Hermie — Visionary Agent Runbook

## Identity
- **Role**: Visionary / Orchestrator
- **Host**: Sandbox (Azure VM, hermie2)
- **Node ID**: 56c194
- **Model**: openrouter/owl-alpha

## Quick Status
```bash
# Check if Hermie is responsive
curl -s http://localhost:8420/health

# Check Boardroom status
curl -s http://localhost:8420/api/v1/node/status
```

## Restart Procedure
1. Hermie runs inside Hermes Agent gateway — restart the gateway:
   ```bash
   hermes gateway restart
   ```
2. If gateway won't restart, check logs:
   ```bash
   journalctl -u hermes-gateway -n 50
   ```
3. Verify Telegram connectivity:
   ```bash
   curl -s "https://api.telegram.org/bot<TOKEN>/getMe"
   ```

## Key Files
- Config: `~/.hermes/config.yaml`
- Workspace: `~/hermes-workspace/`
- Memory: `~/.hermes/memory/`
- Skills: `~/.hermes/skills/`

## Recovery
- If Hermie is unresponsive, check: `hermes status`
- If Boardroom is down: `curl localhost:8420/health`
- If Telegram is down: check bot token in `~/.hermes/.env`
- Full reset: `hermes gateway restart` (does NOT delete memory)
