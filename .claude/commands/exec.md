---
name: exec
description: "Autonomous execution mode. Finds ready beads, works through them (spawning agents for parallel work), runs ralph loop for quality, closes beads, and commits. Invoke with /exec to work all ready beads or /exec [filter] to target specific ones."
---

# Exec — Autonomous Bead Execution

Work through ready beads autonomously: set up worktree, find work, execute, ralph loop, close, commit.

## 0. Worktree Setup

Before starting work, determine the right git worktree:

### Already on a feature worktree?
Check current branch and working directory. If we're already on a feature branch/worktree relevant to the beads, stay here.

### On develop/main and need a feature branch?
Create a new worktree adjacent to the current repo:

```bash
# Convention: {repo-parent}/{repo-name}--{branch-name}
# e.g., ~/Sites/shapeshiftWeb--feat-new-swapper
git worktree add "$(git rev-parse --show-toplevel)--{branch-name}" -b {branch-name}
```

### Initialize new worktree
After creating a new worktree, ALWAYS run setup before any work:

```bash
cd /path/to/worktree
yarn install && yarn build:packages && yarn
```

Wait for each command to complete successfully before proceeding. This is non-negotiable — the worktree won't work without it.

### Existing worktree for this feature?
Check `git worktree list` — if a worktree already exists for the feature branch, use it (no re-init needed unless `node_modules` is missing).

## 1. Find Ready Work

```bash
bd ready
```

- If a filter argument was provided (e.g., `/exec frontend`), filter results: `bd search "frontend" --status=open` and cross-reference with `bd ready`.
- If no ready beads: run `bd list --status open` and report what exists and what's blocking progress.

## 2. Triage

Group ready beads by workstream based on the project structure (e.g., backend, frontend, packages, infra). Read the project's CLAUDE.md and directory layout to understand the workstreams.

Decide: can tasks run in parallel (different workstreams, no shared files) or must they be sequential?

- **Single task** — work on it directly, no team needed. Go to step 3b.
- **Multiple parallel tasks** — spawn an agent team. Go to step 3a.

## 3a. Execution — Agent Team for Parallel Tasks

Use Claude Code's built-in agent team system:

### Step 1: Create team and tasks

```
TeamCreate(team_name="exec-run", description="Executing ready beads")
```

For each bead, create a tracked task:

```
TaskCreate(subject="<bead-id>: <title>", description="...", activeForm="Working on <bead-id>")
```

### Step 2: Spawn workers with the Task tool

For each parallel bead, spawn a worker using the `Task` tool:

```
Task(
  subagent_type="general-purpose",
  name="worker-<bead-id>",
  team_name="exec-run",
  mode="bypassPermissions",
  prompt="..."
)
```

Each worker's prompt **MUST** include:

1. The full output of `bd show <bead-id>` (description, acceptance criteria, dependencies)
2. The working directory (worktree path)
3. Tech stack context from the project's CLAUDE.md
4. Issue tracking: use `bd` CLI — never edit `.beads/issues.jsonl` directly
5. Completion instructions — the worker MUST do ALL of these:
   - Run `yarn type-check` and `yarn lint --fix` for code they changed
   - Run relevant tests (e.g., `npx vitest run path/to/test.ts`)
   - If checks fail: fix the issues and re-run. Do NOT close the bead until checks pass.
   - If stuck: leave the bead open, add a comment with `bd comments add <bead-id> "what failed and why"`, and notify the lead.
   - On success: close the bead with `bd close <bead-id> --reason "description of what was done"`
   - Mark its TaskList task as completed via `TaskUpdate`

### Step 3: Monitor and coordinate

- Use `TaskList` to track worker progress
- Use `SendMessage` to communicate with workers if needed
- When all children of an epic are closed, close the parent epic with `bd close`
- When all work is done, send `shutdown_request` to each worker via `SendMessage`

## 3b. Execution — Single Task

Work on it directly. When implementation is done, proceed to step 3c.

Close the bead after ralph loop passes:

```bash
bd close <bead-id> --reason "description of what was done"
```

## 3c. Ralph Loop — Quality Gate

After implementation (whether single task or team), run a ralph loop to catch remaining issues:

```
/ralph-loop Audit and fix all changes on this branch. Run yarn type-check, yarn lint --fix, and relevant tests. Fix any issues found. Check for regressions, missing edge cases, and code quality. --completion-promise 'All type-checks pass, lint is clean, and tests pass'
```

The ralph loop will iterate until everything is clean. This is the quality gate — no commit happens until ralph is satisfied.

For team runs, the lead should run the ralph loop after all workers complete, as a final integration check.

## 4. Completion

After ralph loop passes:

1. **Verify closure**: `bd list --status open` — confirm completed work is closed.
2. **Sync beads**: `bd sync` — push bead changes to the sync branch.
3. **Commit** each bead's work with a conventional commit message (one commit per bead for clean history, or squash if the changes are tightly coupled).
4. **Push** if on a feature branch (not develop/main).
5. **Clean up**: `TeamDelete` if a team was created.

## Rules

- **ALWAYS** use `bd close` to close beads — never edit `.beads/issues.jsonl` directly.
- **ALWAYS** close beads after completing work — internal TaskList completion is not enough.
- **ALWAYS** run the ralph loop before committing — no shortcuts.
- **ALWAYS** run `bd sync` at the end to push bead state to the sync branch.
- Workers close their own beads via `bd close` — the lead doesn't close on their behalf.
- One commit per bead for clean git history (unless changes are tightly coupled).
- Use Claude Code's built-in `TeamCreate`/`Task`/`SendMessage`/`TaskList` for all orchestration.
- New worktrees MUST run `yarn install && yarn build:packages && yarn` before any work.
