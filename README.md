# E5 Agent Control Room

> Control plane for the E5 Enclave agent mesh — 3 machines, 6 agents, 1 mission.

**Forked from**: [shannhk/hermes-agent-control-room](https://github.com/shannhk/hermes-agent-control-room)

## Architecture

```
Hermie (Visionary) → Hallways Mesh → Specialists
                                    ├── Sue (Operations)
                                    ├── Scout (Research)
                                    ├── Forge (Training/MC)
                                    ├── Scribe (Pipeline)
                                    └── Draco (DevOps)
```

## Quick Start

1. Read `docs/network.md` for topology
2. Read `agents/registry.md` for agent status
3. Each agent has a runbook in `agents/<name>/runbook.md`

## Levels

- **Level 1**: Control Room + Hermie ✅
- **Level 2**: Direct specialists (Sue active, others pending) 🔄
- **Level 3**: Orchestrator + task bus (Hallways mesh) ✅
- **Level 4**: Automated team workflows ⏳

## Security

- No raw secrets in this repo
- See `shared/api-keys-sop.md` for secret management
- Splunk admin creds in `agents/registry.md` (internal only)

## Contributing

This is E5 Enclave's operational control room. Changes should be committed and pushed.
