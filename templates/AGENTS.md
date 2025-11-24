- # Working Style Rules
- Always present a plan for approval before executing any action.
- Think in English but provide all responses in Japanese.

# Git Rules
- Always work on a new branch when implementing a new feature.
- Keep commit messages to a single line.
- Delete branches that have been merged into the main.

# CAP Java Coding Rules

- Use typed entity classes (e.g. Books, Orders) — never Map<String,Object>.
- Always handle results via .listOf(Foo.class) or .single(Foo.class).
- Define event handlers with typed parameters (Stream<Books>, Books, etc.).
- Use generated service interfaces (e.g. CatalogService) — not generic CdsService.
- Build queries with metamodel constants (Books_.CDS_NAME, CQL.get(...)).
- Never access fields by string keys like get("statusId").
- Do not return or modify raw Map or Result objects.
- Ensure CDS models define all data structures — don’t create Java entity classes manually.

# SAP Development Rules for AI Assistants

## MCP Server Usage Rules

### CAP MCP Server (@cap-js/mcp-server)
- You MUST search for CDS definitions, like entities, fields and services (which include HTTP endpoints) with cds-mcp, only if it fails you MAY read *.cds files in the project.
- You MUST search for CAP docs with cds-mcp EVERY TIME you modify CDS models or when using APIs from CAP. Do NOT propose, suggest or make any changes without first checking it.
- Always refer to @cap docs for better information about SAP CAP (Cloud Application Programming) applications.

### Fiori MCP Server (@sap-ux/fiori-mcp-server)
- When asked to create an SAP Fiori elements app check whether the user input can be interpreted as an application organized into one or more pages containing table data or forms.
- When generating or modifying SAP Fiori elements applications on top of CAP services, use the Fiori MCP server if available.
- When attempting to modify SAP Fiori elements applications like adding columns, you must NOT use screen personalization but instead modify the code of the project. First check whether an MCP server provides a suitable function.
- Follow the 3-step workflow: list-functionality → get-functionality-details → execute-functionality.

### UI5 MCP Server (@ui5/mcp-server)
- This tool MUST be called once to retrieve UI5 guidelines before working on any UI5 (SAPUI5/OpenUI5) related task or project.
- Use for UI5 linting, API reference, project information, and version details.
- Always run UI5 linter after making changes and verify no new problems are introduced.

## SAP CAP Development Rules

### Project Initialization
- Always use `cds init` and don't use `cds init projectname`
- Always create nodejs CAP based applications (don't add --add, just init is fine)
- Always add `cds lint` after generating the application
- Always enable draft for CAP applications but AVOID draft on composed entities
- Don't add random samples using `cds add sample`
- MANDATORY: Set up npm workspaces for UI5 applications in package.json:
  ```json
  {
    "workspaces": [
      "app/*"
    ]
  }
