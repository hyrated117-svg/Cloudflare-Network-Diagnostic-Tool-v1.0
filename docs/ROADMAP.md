# ROADMAP.md

## Overview
This roadmap outlines the planned evolution of the **Cloudflare Network Diagnostic Tool (CNDT)** and the **App‑Maker Platform**, covering feature milestones, architectural expansions, performance targets, and long‑term strategic goals.  
It is divided into **versions**, **tracks**, and **deliverables** to ensure clarity and predictable development.

---

## Version timeline

- **v1.0 – Core release (complete)**  
  Baseline diagnostic engine, Cloudflare API integration, CLI + SwiftUI app, repo structure, security baseline.

- **v1.1 – Stability & UX upgrade (current target)**  
  UI polish, error‑handling improvements, performance tuning, extended Cloudflare endpoints.

- **v2.0 – App‑Maker Platform integration**  
  Full modular plugin system, template generator, SwiftUI project scaffolding, GitHub Actions automation.

- **v3.0 – Cloudflare Intelligence Layer**  
  Predictive routing, anomaly detection, Cloudflare Radar integration, AI‑assisted diagnostics.

- **v4.0 – Distributed node network**  
  Multi‑node testing, mesh diagnostics, remote agent orchestration.

---

## 1. v1.1 – Stability, UX, and performance upgrade

### Goals
Deliver a polished, stable, user‑friendly version with improved diagnostics and better developer experience.

### Deliverables

- **Enhanced error handling:**  
  - Unified error model  
  - Cloudflare API fallback logic  
  - Retry and backoff strategies  
  - Structured error codes for CLI and UI

- **UI/UX improvements:**  
  - SwiftUI layout refinements (adaptive, responsive)  
  - Dark mode polish and consistent theming  
  - Real‑time status indicators for each diagnostic step  
  - Animated diagnostic progress bar and completion states  
  - Clear “summary” screen with pass/warn/fail badges

- **Performance optimisation:**  
  - Reduce API call latency via batching where possible  
  - Cache Cloudflare zone metadata locally  
  - Parallelise non‑dependent checks (DNS, WAF, Firewall)  
  - Add lightweight profiling hooks for future tuning

- **Extended Cloudflare API coverage:**  
  - DNSSEC status and validation  
  - Firewall events and rules overview  
  - Argo/Zero Trust configuration checks  
  - WAF analytics and rule hit summaries

- **Improved CLI experience:**  
  - `--json` output for automation and scripting  
  - `--fast` mode for minimal essential checks  
  - `--verbose` mode for deep debugging  
  - Exit codes aligned with severity (0/1/2)

---

## 2. v2.0 – App‑Maker Platform integration

### Goals
Transform the repo into a **dual‑purpose platform**: diagnostics + app generation.

### Deliverables

- **SwiftUI project generator:**  
  - Templates for:  
    - Network diagnostics dashboard app  
    - General network utility app  
    - Cloudflare admin companion app  
  - Automatic bundle ID and signing hints  
  - GitHub repo auto‑initialisation (README, LICENSE, CI)

- **Plugin architecture:**  
  - Modular diagnostic modules (DNS, WAF, Firewall, Radar, etc.)  
  - Hot‑swappable plugins loaded via manifest  
  - Plugin manifest format (`plugin.json` or `plugin.yml`)  
  - Versioning and compatibility checks for plugins

- **App‑Maker CLI:**  
  - `appmaker create <template>` – scaffold a new SwiftUI app  
  - `appmaker add plugin <name>` – attach diagnostic modules  
  - `appmaker publish` – prepare repo + tags for release  
  - Config file support (`appmaker.config`)

- **GitHub Actions integration:**  
  - Auto‑build for Swift + CLI binaries  
  - Auto‑lint (SwiftLint, shellcheck, etc.)  
  - Auto‑release packaging (tags, changelog, artifacts)  
  - Test matrix for macOS + Linux runners

---

## 3. v3.0 – Cloudflare Intelligence Layer

### Goals
Introduce predictive, AI‑assisted diagnostics and Cloudflare Radar intelligence.

### Deliverables

- **Anomaly detection engine:**  
  - Latency deviation detection per region/POP  
  - Packet‑loss pattern recognition  
  - Cloudflare outage correlation using public status/Radar  
  - Threshold‑based alerts and scoring

- **Radar API integration:**  
  - Regional traffic insights (per country/ASN)  
  - Attack trends and DDoS indicators  
  - Routing health and congestion signals  
  - Visual overlays in dashboard UI

- **Predictive routing suggestions:**  
  - Suggest optimal Cloudflare POPs or routing strategies  
  - Recommend DNS changes (TTL, record types, fallback)  
  - Identify misconfigured zones or missing records  
  - Export suggestions as JSON/Markdown reports

- **AI‑assisted diagnostic summaries:**  
  - Human‑readable reports for non‑experts  
  - Severity scoring (info/warn/critical)  
  - Suggested fixes with step‑by‑step actions  
  - Optional “share report” format for teams

---

## 4. v4.0 – Distributed node network

### Goals
Enable multi‑node, multi‑region testing with remote orchestration.

### Deliverables

- **Remote agent system:**  
  - Lightweight Go or Rust agent binary  
  - Secure token‑based registration with central controller  
  - Encrypted communication (mTLS or WireGuard‑style)  
  - Simple install scripts for Linux/macOS

- **Mesh diagnostics:**  
  - Node‑to‑node latency and path comparison  
  - Route comparison across ISPs and regions  
  - Multi‑POP Cloudflare testing from distributed nodes  
  - Aggregated metrics and per‑node health

- **Distributed dashboard:**  
  - Real‑time map of nodes and their status  
  - Node health indicators (online, degraded, offline)  
  - Test orchestration UI (run tests on subsets of nodes)  
  - Historical view of runs and trends

- **Team collaboration features:**  
  - Shared test history with tagging and notes  
  - Role‑based access control (viewer/operator/admin)  
  - Cloudflare Zero Trust integration for auth  
  - Exportable audit logs for compliance

---

## Long‑term vision (v5.0+)

- **Full Cloudflare admin suite:**  
  Manage DNS, WAF, Firewall, Workers, KV, R2, Argo, Zero Trust from a unified interface.

- **Marketplace for plugins:**  
  Community‑built diagnostic and utility modules, with rating and versioning.

- **Mobile app (iOS + Android):**  
  - SwiftUI‑based iOS client  
  - Kotlin Multiplatform‑based Android client  
  - Shared core logic where possible

- **Enterprise mode:**  
  - SSO (SAML/OIDC)  
  - Audit logs and compliance exports  
  - Encrypted logs and data retention policies  
  - Multi‑tenant support

---

## Development tracks

### 1. Core diagnostics track
- **Cloudflare API expansion**  
- **Performance tuning**  
- **Multi‑node support**  
- **Predictive analytics**

### 2. App‑Maker track
- **Template generator**  
- **Plugin system**  
- **SwiftUI scaffolding**  
- **GitHub automation**

### 3. Infrastructure track
- **CI/CD pipelines**  
- **Release automation**  
- **Security hardening**  
- **Distributed agents**

### 4. UX & frontend track
- **SwiftUI improvements**  
- **Dashboard redesign**  
- **Visual diagnostics and charts**  
- **Accessibility compliance (WCAG)**

---

## Milestone table

| Milestone                | Version | Status      | Description                                      |
|--------------------------|---------|------------|--------------------------------------------------|
| **Core engine**          | v1.0    | Complete    | Baseline diagnostics + Cloudflare API            |
| **UX & stability**       | v1.1    | In progress | UI, error handling, performance                   |
| **App‑Maker Platform**   | v2.0    | Planned     | Templates, plugins, CLI                           |
| **Intelligence Layer**   | v3.0    | Planned     | Radar, anomaly detection, AI                      |
| **Distributed network**  | v4.0    | Planned     | Remote agents, mesh testing                       |

---

## Contributing

Contributions are welcome across all tracks.  
See `CONTRIBUTING.md` for guidelines, coding standards, and review process.

---
