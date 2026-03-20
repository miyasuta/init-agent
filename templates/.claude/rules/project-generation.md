# Project Generation (MANDATORY)

**NEVER** manually create project structure (directories, config files, etc.).
**ALWAYS** use CLI tools to generate projects.

## CAP Projects

```bash
cds init --nodejs   # Node.js
cds init --java     # Java
```

## UI5 / Fiori Elements Projects

Use the `@sap-ux/fiori-mcp-server` MCP server to generate projects:

1. **List available functionalities**
   ```
   mcp: fiori → list-functionality
   ```

2. **Get details for the target functionality** (e.g. `generate-fiori-app`)
   ```
   mcp: fiori → get-functionality-details { "functionality": "<name>" }
   ```

3. **Execute the functionality** with the required parameters
   ```
   mcp: fiori → execute-functionality { "functionality": "<name>", ... }
   ```

**NEVER** use `yo @sap/fiori` directly — always go through the MCP server.

**Default language: TypeScript** — unless the user explicitly specifies otherwise.
