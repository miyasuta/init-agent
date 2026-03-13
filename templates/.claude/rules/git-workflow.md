# Git Workflow (MANDATORY)

- **Always** work on new branch (never commit to main)
- **Single-line** commit messages (imperative mood)
- **Delete** branch after merge

## Branch Naming

```bash
git checkout -b feature/description
git checkout -b fix/description
git checkout -b docs/description
```

## Commit Messages

```bash
# ✅ GOOD
git commit -m "Add user authentication feature"
git commit -m "Fix navigation property filtering"

# ❌ BAD
git commit -m "Fixed some bugs and added new features"  # multiple things
git commit -m "WIP"                                     # not descriptive
```

## After Approval: Merge and Delete

```bash
git checkout main
git merge feature/your-feature
git branch -d feature/your-feature
```
