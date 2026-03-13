---
paths:
  - "**/*.java"
  - "**/pom.xml"
---

# CAP Java (MANDATORY)

## Type Safety Rules

**Never use `Map<String, Object>`** — use typed entity classes:
```java
// ✅
List<Books> books = result.listOf(Books.class);
// ❌
List<Map<String, Object>> books = result.list();
```

**Never use generic `CdsService`** — use generated service interfaces:
```java
// ✅
@Autowired @Qualifier(CatalogService_.CDS_NAME)
private CatalogService catalogService;
// ❌
@Autowired @Qualifier("CatalogService")
private CdsService catalogService;
```

**Never hardcode strings** — use metamodel constants:
```java
// ✅
CqnSelect query = Select.from(Books_.class).where(b -> b.get(Books.STOCK).gt(0));
// ❌
CqnSelect query = Select.from("Books");
```

**Never use fully qualified class names** — use import statements:
```java
// ✅
import com.sap.cds.ql.cqn.CqnComparisonPredicate;
CqnComparisonPredicate comparison = (CqnComparisonPredicate) predicate;
// ❌
com.sap.cds.ql.cqn.CqnComparisonPredicate comparison = ...;
```

## PersistenceService vs ApplicationService

```java
// Direct DB access (bypasses service handlers)
@Autowired @Qualifier(PersistenceService.DEFAULT_NAME)
private PersistenceService db;

// Service-level operations (triggers service handlers)
@Autowired @Qualifier(CatalogService_.CDS_NAME)
private CatalogService service;
```

Service entities are projections, not DB tables. To get the DB entity name:
```java
String dbEntityName = entity.query().get().ref().firstSegment();
```

## Debug Logging

```java
private static final Logger logger = LoggerFactory.getLogger(MyHandler.class);

logger.debug("READ request for: {}", select.ref().targetSegment().id());
```
