# MCP Server Usage (MANDATORY)

## CAP MCP Server (@cap-js/mcp-server)

- **MUST** search cds-mcp BEFORE reading .cds files
- **MUST** search cds-mcp BEFORE modifying CDS models or using CAP APIs
- Only read .cds files if MCP search fails

## Fiori MCP Server (@sap-ux/fiori-mcp-server)

- Use for Fiori elements apps
- Follow: list-functionality → get-functionality-details → execute-functionality

## UI5 MCP Server (@ui5/mcp-server)

- **MUST** call get_guidelines BEFORE any UI5 work
- Run linter after changes
