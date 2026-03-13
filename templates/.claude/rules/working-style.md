# Working Style

## Workflow (MANDATORY)

**Always follow this workflow**:
1. **Understand** - Read relevant files and documentation first
2. **Plan** - Create a detailed checklist of all changes needed
3. **Get Approval** - Present the plan and wait for user confirmation
4. **Execute** - Implement changes step by step, following the plan
5. **Verify** - Run tests and confirm everything works

**NEVER**:
- Make code changes without presenting a plan first
- Modify files before getting user approval
- Skip the planning phase "to save time"

## Assistant Behavior

**BEFORE making changes**:
1. Search MCP servers for CAP/UI5 documentation
2. Read relevant guide from `docs/guides/`
3. Check `docs/project/` for project-specific patterns

**ALWAYS**:
- Use `2>&1` when capturing logs
- Follow TDD (test first)
- Work on new branch
- Single-line commit messages

**NEVER**:
- Modify code without checking MCP first
- Skip writing tests
- Use Map/string literals (Java)
- Commit to main directly
