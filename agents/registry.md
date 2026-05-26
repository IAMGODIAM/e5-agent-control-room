# E5 Agent Registry

> ⚠️ **SECURITY NOTE**: This registry contains metadata only. No raw credentials.
> All secrets are stored in `~/.hermes/.env` on respective hosts. See `shared/api-keys-sop.md`.
> **Last credential audit:** 2026-05-26 (P0 scrub — Sue/IAMGODIAM)


> Control plane registry for the E5 Enclave agent mesh.
> Last updated: 2026-05-17

## Active Agents

| Agent | Role | Host | Node ID | Status | Runbook |
|-------|------|------|---------|--------|---------|
| **Hermie** | Visionary / Orchestrator | Sandbox (Azure VM) | 56c194 | ✅ Active | `agents/hermes/runbook.md` |
| **Sue** | Chief of Staff / Operations | Base44 Cloud | sue-45c3e283 | ✅ Active | `agents/sue/runbook.md` |
| **Scout** | Research Agent | TBD | — | ⏳ Pending | `agents/scout/runbook.md` |
| **Forge** | Training / MC Agent | Monte-Cristo (MC) | — | ⏳ Pending | `agents/forge/runbook.md` |
| **Scribe** | Annotation / Pipeline | TBD | — | ⏳ Pending | `agents/scribe/runbook.md` |
| **Draco** | Infrastructure / DevOps | TBD | — | ⏳ Pending | `agents/draco/runbook.md` |

## Infrastructure Nodes

| Node | Hostname | IP | OS | Role |
|------|----------|----|----|------|
| **Sandbox** | hermie2 | 100.126.20.78 (Tailscale) / 192.168.1.6 (LAN) | Linux (WSL2) | Primary agent host, Boardroom |
| **Monte-Cristo** | MC | 100.126.20.78 / 192.168.1.212 | Windows 11 Pro | Workstation, Splunk, Codex |
| **Mac** | — | 192.168.1.61 | macOS | Boardroom node |

## Key Services

| Service | Host | Port | Endpoint |
|---------|------|------|----------|
| Hallways Boardroom | Sandbox | 8420 | `http://localhost:8420` |
| Hallways Relay | Sandbox | 8421 | `http://localhost:8421` |
| Splunk Enterprise | MC | 8000 | `https://192.168.1.212:8000` |
| Hermes Gateway | MC | — | Telegram @Hermie9bot |

## Communication Channels

- **Telegram**: @Hermie9bot (primary), Ops Group (-1003842551442)
- **Hallways Mesh**: Boardroom API + Relay
- **GitHub**: IAMGODIAM org

## Security Notes

- No raw secrets in this repo
- API keys stored in `~/.hermes/.env` on respective hosts
- Splunk admin: credentials stored in `~/.hermes/.env` on MC — key name: `SPLUNK_ADMIN_PASSWORD` (never commit value)
- Boardroom auth token: stored in `~/.hermes/.env` on respective host — key name: `BOARDROOM_AUTH_TOKEN` (never commit value)
