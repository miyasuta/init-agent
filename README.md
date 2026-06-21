# init-agent

A setup tool for starting CAP (Cloud Application Programming Model) development with AI coding assistants.

## Purpose

Easily set up development guidelines and MCP configurations for AI coding assistants (Claude Code, Codex, etc.) in new CAP projects.

## Features

This tool copies the following files to your project:

- **CLAUDE.md** - Configuration file for Claude Code (references AGENTS.md)
- **AGENTS.md** - Universal guidelines for all AI assistants
- **docs/** - Detailed development guides
  - Git workflow
  - Debugging and log capture
  - Test-driven development strategy
  - CAP Java development guide
- **.mcp.json** - MCP (Model Context Protocol) server configuration
  - CAP MCP Server (`@cap-js/mcp-server`)
  - Fiori MCP Server (`@sap-ux/fiori-mcp-server`)

After copying, these files are automatically added to `.gitignore`.

## Usage

### 1. Run in a New CAP Project

```bash
cd /path/to/your/new/cap/project
/path/to/init-agent/init-agent.sh
```

### 2. Result

The following files are created in your project root:

```
your-project/
├── CLAUDE.md          # Guidelines for AI assistants
├── AGENTS.md          # Universal AI assistant guidelines
├── docs/              # Detailed development guides
├── .mcp.json          # MCP configuration
└── .gitignore         # Above files added
```

### 3. Documentation Structure

- **CLAUDE.md** references **AGENTS.md** for comprehensive guidelines
- **AGENTS.md** references detailed guides in `docs/guides/`
- This modular structure keeps essential rules visible while detailed guides remain accessible

For detailed guidelines, see:
- [AGENTS.md](templates/AGENTS.md) - Universal guidelines for all AI assistants
- [docs/guides/](templates/docs/guides/) - Detailed development guides

## Template Structure

```
templates/
├── CLAUDE.md                    # Entry point for Claude Code
├── .mcp.json                    # MCP configuration
├── AGENTS.md                    # Universal AI assistant guidelines
└── docs/
    └── guides/                  # Detailed guides
        ├── git-workflow.md      # Git workflow
        ├── debugging-guide.md   # Debugging and log capture
        ├── test-strategy.md     # TDD strategy
        └── java/
            └── development-guide.md  # CAP Java development guide
```

## MCP Servers

### Included in `.mcp.json`

These are project-specific servers that must be explicitly enabled per project:

| Server | Package | Purpose |
|--------|---------|---------|
| `cds-mcp` | `@cap-js/mcp-server` | CAP/CDS model search and documentation |
| `fiori-mcp` | `@sap-ux/fiori-mcp-server` | Fiori app generation and documentation |

### Managed separately (not in `.mcp.json`)

The following servers are available via Claude plugins or remote MCP and are active globally — no per-project configuration needed:

| Server | Source | Purpose |
|--------|--------|---------|
| `ui5-mcp-server` | `ui5@claude-plugins-official` plugin | UI5 API reference and linting |
| `mcp-sap-docs` | claude.ai remote MCP | SAP documentation search |

If you need to add these manually (e.g. in an environment without the plugin), use the following configuration in `.mcp.json`:

```json
{
  "mcpServers": {
    "sap-docs-remote": {
      "type": "http",
      "url": "https://mcp-sap-docs.marianzeis.de/mcp"
    },
    "ui5-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@ui5/mcp-server"]
    }
  }
}
```

## Important Notes

- Execution aborts if `CLAUDE.md`, `AGENTS.md`, or `.mcp.json` already exist
- `.gitignore` is created if it doesn't exist
- Copied files are automatically added to `.gitignore`
- `tmp/` directory is added to `.gitignore` for log output (created by AI agents as needed)

## Customization

Customize the following based on your project:

1. **AGENTS.md** "Project Type" section
   - Select runtime (Java/Node.js)
   - Check enabled features (Fiori Elements, Draft, etc.)
2. **Quick Reference Commands** section
   - Update with actual project paths

## License

MIT
