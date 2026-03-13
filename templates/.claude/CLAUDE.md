# Claude Code Instructions

## Project Type

<!-- Update this section based on your project -->
**Framework**: SAP Cloud Application Programming Model (CAP)
**Runtime**: [ ] Java [ ] Node.js
**Features**: [ ] Fiori Elements [ ] Draft [ ] Custom Services

## Documentation Structure

- **`.claude/CLAUDE.md`** (this file): Project-specific configuration
- **`.claude/rules/`**: Development rules and coding standards
- **`docs/project/`**: Project-specific implementation details

## Quick Reference

<!-- Update paths based on your project -->

### Build and Test

**Java**:
```bash
cd /path/to/project
mvn clean install
mvn test
mvn test -Dtest=TestClass#method
```

**Node.js**:
```bash
cd /path/to/project
npm install
node --test
node --test path/to/test.js
```

### Capture Logs (CRITICAL: use 2>&1)

```bash
# mkdir -p tmp  # Only needed if tmp/ doesn't exist (e.g., Codex; Claude Code can skip)
mvn test > tmp/test.log 2>&1       # Java
node --test > tmp/test.log 2>&1    # Node.js
grep "pattern" tmp/test.log
```

## Resources

- CAP Documentation: https://cap.cloud.sap/docs/
- CAP Java SDK: https://cap.cloud.sap/docs/java/
- CAP Node.js SDK: https://cap.cloud.sap/docs/node.js/
- Fiori Elements: https://ui5.sap.com/test-resources/sap/fe/demokit/index.html
- UI5 Documentation: https://ui5.sap.com/
