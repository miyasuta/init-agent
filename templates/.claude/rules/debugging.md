# Debugging: Stream Redirection (MANDATORY)

**ALWAYS use `2>&1` when capturing logs** (CAP logs to stderr):

```bash
# BEST PRACTICE: Redirect to file first, then grep
# This avoids issues with tee and allows multiple grep operations

# ✅ CORRECT - Use project tmp/ directory
# Note: Create tmp/ first if your environment doesn't provide its own workspace (e.g., Codex)
# mkdir -p tmp
mvn test > tmp/test.log 2>&1      # Java
node --test > tmp/test.log 2>&1   # Node.js

# ❌ WRONG - Misses all application logs
mvn test | grep "pattern"
node --test | grep "pattern"
```

**Note**: The `tmp/` directory is created by init-agent.sh and added to `.gitignore`. If your environment provides its own workspace (e.g., Claude Code), you do not need to run `mkdir -p tmp` explicitly.

See [Debugging Guide](../docs/guides/debugging-guide.md) for details.
