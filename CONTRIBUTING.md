# 🤝 Contributing Guide  
Cloudflare Network Diagnostic Tool • MCP Server • AppMaker Generator

Thank you for your interest in contributing. This project welcomes high‑quality contributions across SwiftUI, Python, Node, documentation, and tooling.

---

## 🧠 Before You Start

Please read:

- [SECURITY Policy](ca://s?q=Open_SECURITY_policy)
- [Performance Guide](ca://s?q=Open_PERFORMANCE_Guide)
- [Code of Conduct](ca://s?q=Open_CODE_OF_CONDUCT)

These documents define the expectations for safe, performant, and respectful contributions.

---

## 🛠️ Development Environment

### Requirements
- macOS or Linux recommended  
- Swift 5.9+  
- Python 3.10+  
- Node 20+  
- Xcode 15+ (for SwiftUI app)  

### Recommended Tools
- Xcode Instruments  
- py-spy / cProfile  
- Node DevTools profiler  

---

## 🏗️ Repository Structure

See the full structure here:

- [Repository Layout](ca://s?q=Show_GitHub_repository_structure)

---

## 🔧 Contribution Types

### 1. SwiftUI App
- UI improvements  
- Diagnostic engine enhancements  
- Performance optimizations  
- Accessibility improvements  

### 2. MCP Server
- New tools  
- Resource improvements  
- Protocol enhancements  
- Latency optimizations  

### 3. AppMaker Generator
- New templates  
- Module injection logic  
- FileWriter improvements  
- ZIP compression tuning  

### 4. Documentation
- Architecture diagrams  
- API references  
- Troubleshooting guides  

---

## 🧪 Testing Requirements

All contributions must include:

- Unit tests (Swift, Python, or Node)  
- Performance checks  
- No regressions in diagnostic latency  
- No blocking on main thread (SwiftUI)  

---

## 🔐 Security Requirements

All contributions must follow:

- No dynamic code execution  
- No unsafe file writes  
- No external network calls outside diagnostics  
- No telemetry or analytics  

See: [Security Policy](ca://s?q=Open_SECURITY_policy)

---

## 🚀 Submitting a Pull Request

1. Fork the repository  
2. Create a feature branch  
3. Commit with clear messages  
4. Run all tests  
5. Submit PR with:  
   - Summary  
   - Motivation  
   - Performance impact  
   - Security considerations  

---

## 🏁 Code Style

### Swift
- SwiftLint rules  
- Value semantics preferred  
- Avoid force unwraps  

### Python
- PEP8  
- No global state  
- Prefer async where possible  

### Node
- ES modules  
- No dynamic `eval`  
- Stable JSON output  

---

## ❤️ Thank You

Your contributions help keep this project fast, secure, and open.
