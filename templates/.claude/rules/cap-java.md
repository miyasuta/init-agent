---
paths:
  - "**/*.java"
  - "**/pom.xml"
---

# CAP Java Type Safety (MANDATORY)

- **Never** use `Map<String, Object>` - use typed entity classes
- **Never** use generic `CdsService` - use generated service interfaces
- **Never** hardcode strings - use metamodel constants
- **Never** use fully qualified class names in code - use import statements

See [Java Development Guide](../docs/guides/java/development-guide.md) for details.
