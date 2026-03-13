# Test-Driven Development (MANDATORY)

**Always follow TDD**:
1. Write test first
2. Confirm test fails
3. Implement feature
4. Verify test passes

**Use protocol-level tests** (HTTP/OData) unless specified otherwise.

## Before Writing Tests

**ALWAYS search cds-mcp for CAP testing patterns first** — do NOT use plain JUnit/Node.js patterns without checking CAP-specific approaches.

## Test Naming

Pattern: `{operation}Should{expectedBehavior}[Under{condition}]`

**Java**: `listQueryShouldExcludeSoftDeletedRecords()`
**Node.js**: `test('should exclude soft deleted records from list query', ...)`

## Structure: Arrange-Act-Assert

```
// Arrange: create test data (unique per test)
// Act: perform the operation
// Assert: verify expected behavior
```

Each test creates its own isolated data — tests must be independent and runnable in any order.
