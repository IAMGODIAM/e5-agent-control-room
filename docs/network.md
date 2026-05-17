# E5 Network Topology

> 3-machine mesh architecture for the E5 Enclave.

## Overview

```
┌─────────────────────────────────────────────────────────────┐
│                        E5 ENCLAVE                            │
│                                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐   │
│  │   SANDBOX     │    │  MONTE-CRISTO │    │     MAC      │   │
│  │  (Azure VM)   │    │  (Windows 11) │    │   (macOS)    │   │
│  │              │    │              │    │              │   │
│  │  Hermie 🧠   │◄──►│  Forge 🔨    │    │  Boardroom   │   │
│  │  Boardroom 🏛│    │  Splunk 📊   │    │  (v0.3.0)   │   │
│  │  Relay 📡    │    │  Codex 💻    │    │              │   │
│  │              │    │  Claude Code │    │              │   │
│  └──────┬───────┘    └──────┬───────┘    └──────┬───────┘   │
│         │                   │                   │           │
│         └───────────────────┴───────────────────┘           │
│                    Tailscale / LAN                           │
└─────────────────────────────────────────────────────────────┘
```

## Machine Details

### Sandbox (hermie2) — Primary Node
- **IP**: 100.126.20.78 (Tailscale) / 192.168.1.6 (LAN)
- **OS**: Linux (WSL2 on Azure VM)
- **RAM**: 32GB | **CPU**: 24 cores | **Disk**: 890GB free
- **Roles**: 
  - Hermie (Visionary agent, node 56c194)
  - Hallways Boardroom (v1.0.0, port 8420)
  - Hallways Relay (port 8421)
  - Primary orchestration hub

### Monte-Cristo (MC) — Workstation
- **IP**: 100.126.20.78 / 192.168.1.212
- **OS**: Windows 11 Pro Insider Preview (Build 29591)
- **RAM**: 64GB | **CPU**: AMD Ryzen 9 3900X (12C/24T) | **Disk**: 181GB free
- **Roles**:
  - Forge (training agent)
  - Splunk Enterprise 10.2.3 (security monitoring)
  - Codex (OpenAI Codex CLI)
  - Claude Code (via SSH file-based pipe)
  - Hermes Gateway (Telegram @Hermie9bot)

### Mac — Secondary Node
- **IP**: 192.168.1.61
- **OS**: macOS
- **Roles**:
  - Hallways Boardroom (v0.3.0, auto-start)

## Network Paths

| Path | Protocol | Auth |
|------|----------|------|
| Sandbox → MC | SSH (port 22) | `~/.ssh/hermes_agent` |
| Sandbox → Mac | SSH | Key-based |
| MC → Sandboard | SSH | Key-based |
| Boardroom API | HTTP/REST | Bearer token |
| Hallways Relay | HTTP | Node trust |
| Telegram | HTTPS | Bot token |

## Port Map

| Port | Service | Host | Access |
|------|---------|------|--------|
| 8420 | Boardroom | Sandbox, Mac | LAN + Tailscale |
| 8421 | Relay | Sandbox | LAN + Tailscale |
| 8000 | Splunk Web | MC | LAN |
| 8089 | Splunk Mgmt | MC | LAN |
| 22 | SSH | All | LAN + Tailscale |

## Runtime Split

Per the Control Room pattern:

```
/root/agent-control-room/    → docs, templates, registry (no secrets)
/srv/<agent>/data/           → runtime (.env, memory, skills, sessions, crons, logs)
```

E5 adaptation:

```
/home/user/hermes-workspace/hermes-agent-control-room/  → control plane
~/.hermes/                                               → agent config
~/.hermes/workspace/                                     → active work
```
