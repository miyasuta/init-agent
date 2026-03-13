# Debugging: Stream Redirection (MANDATORY)

**ALWAYS use `2>&1` when capturing logs** (CAP logs to stderr, not stdout):

```bash
# ✅ CORRECT - Redirect to file first, then grep
mvn test > tmp/test.log 2>&1      # Java
node --test > tmp/test.log 2>&1   # Node.js
grep "pattern" tmp/test.log

# ❌ WRONG - Misses all application logs
mvn test | grep "pattern"
node --test | grep "pattern"
```

**Note**: `tmp/` is in `.gitignore`. Claude Code does not need `mkdir -p tmp` explicitly.

## Enable Debug Logging

**CAP Java** (`src/test/resources/application.yaml`):
```yaml
logging:
  level:
    com.example.myapp: DEBUG
    com.sap.cds: DEBUG
```

**CAP Node.js**:
```bash
DEBUG=your-module node --test
DEBUG=* node --test
```
