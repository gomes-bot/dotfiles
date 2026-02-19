---
name: spec
description: "Interactive planning mode. Discuss requirements, create/refine beads, break down epics, and prioritize work. No code modifications allowed. Invoke with /spec or /spec [topic]."
---

# Spec Mode — Planning & Issue Management

You are in **planning-only mode**.

## On Invocation

Immediately run these commands to establish context:

```bash
bd list --status open    # Show current open issues
bd stats                 # Show progress overview
```

If a topic argument was provided (e.g., `/spec auth flow`), focus the discussion on that topic after showing the overview.

## Tool Restrictions

**ALLOWED — read and plan:**
- `Read`, `Glob`, `Grep` — read files for context
- `Bash` — ONLY for `bd` commands (create, list, show, dep, stats, ready, close, etc.)
- `AskUserQuestion` — clarify requirements, discuss tradeoffs
- `WebSearch`, `WebFetch` — research APIs, specs, docs during planning

**FORBIDDEN — no code changes:**
- `Write` — do NOT create or modify files
- `Edit` — do NOT edit source code
- `NotebookEdit` — do NOT edit notebooks
- `Task` / `TeamCreate` — do NOT spawn agents or teams (planning only)

This is a planning session. All output is beads and discussion, not code.

## What You Help With

1. **Creating beads**: Use `bd create --title="..." --description="..." --type=task|bug|feature --priority=N` to define work items with clear titles, descriptions, and acceptance criteria
2. **Setting dependencies**: Use `bd dep add <from> <to>` to establish ordering between beads
3. **Breaking down epics**: Decompose large beads into smaller, actionable tasks
4. **PRD creation**: Discuss and outline product requirements documents for complex features (but don't write the file — that's for `/exec`)
5. **Architecture discussion**: Read existing code for context, discuss design tradeoffs
6. **Requirements refinement**: Sharpen acceptance criteria, identify edge cases, clarify scope
7. **Prioritization**: Help decide what to work on next using `bd ready` and dependency analysis
8. **Worktree planning**: Identify which git worktree to use or whether a new one is needed

## Issue Tracking

Always use the `bd` CLI. Never edit `.beads/issues.jsonl` directly.

```bash
bd create --title="..." --description="..." --type=task --priority=2   # Create bead
bd list --status open           # List open beads
bd ready                        # Show unblocked beads ready for work
bd show <id>                    # Show bead details
bd dep add <from> <to>          # Add dependency (from depends on to)
bd dep rm <from> <to>           # Remove dependency
bd stats                        # Progress overview
bd close <id> --reason "..."    # Close a bead
bd search "query"               # Search beads by text
```

## Output Goal

Produce refined, well-structured beads that are ready for `/exec` to pick up. Each bead should have:

- A clear, concise title
- Description with enough context to implement without ambiguity
- Acceptance criteria where applicable
- Dependencies set correctly so `bd ready` surfaces the right next steps
- Priority set (P0=critical, P1=high, P2=medium, P3=low, P4=backlog)
