---
name: create_handoff
description: "Write a concise session handoff to ~/.claude/handoffs/ capturing git + beads context (both optional). Creates a durable markdown file for future sessions to resume from."
allowed-tools: Read, Glob, Grep, Write, Bash, AskUserQuestion
argument-hint: "[short-kebab-desc]"
---

# Create Handoff

Capture current session context into a handoff document for future sessions to resume from.

## Inputs

- `$ARGUMENTS`: optional short kebab-case description (e.g., `ton-tx-parsing`, `yields-refactor`)
- If empty, default desc to `handoff`

## Step 1: Detect Context

Run all detection via Bash. Each block is independent and failure-proof — skip silently if unavailable.

### Git context

Only if `git rev-parse --is-inside-work-tree 2>/dev/null` succeeds:

```bash
echo "REPO_ROOT=$(git rev-parse --show-toplevel)"
echo "REPO_NAME=$(basename "$(git rev-parse --show-toplevel)")"
echo "BRANCH=$(git branch --show-current)"
echo "LAST_COMMIT=$(git log -1 --oneline)"
echo "GIT_COMMON_DIR=$(git rev-parse --git-common-dir)"
echo "---GIT STATUS---"
git status --short
```

- **Worktree detection**: if `git rev-parse --git-common-dir` does NOT end with `/.git` (i.e., it's a path like `../../.git`), we're in a linked worktree. Note the worktree path.

### Beads context

Only if `command -v bd >/dev/null 2>&1` AND `[ -e .beads/issues.jsonl ]`:

```bash
echo "---BD STATS---"
bd stats
echo "---BD IN PROGRESS---"
bd list --status=in_progress
echo "---BD READY---"
bd ready
echo "---BD OPEN---"
bd list --status=open
```

## Step 2: Generate Topic Folder and File Path

Build the **topic folder name** from detected context:

1. **repo**: `basename` of git repo root (fall back to `basename "$PWD"` if not a repo)
2. **branch**: current git branch
3. **Combine**:
   - On `develop` / `main` / `master` → topic = `{repo}`
   - On a feature branch → topic = `{repo}--{branch}`
   - The worktree is implicit — the branch name already identifies it

**File path**: `~/.claude/handoffs/{topic}/{YYYY-MM-DD_HH-MM-SS}_{desc}.md`

- `desc` = `$ARGUMENTS` sanitized to kebab-case, or `handoff` if none provided
- Create the topic directory with `mkdir -p` if it doesn't exist
- Generate timestamp with: `date +%Y-%m-%d_%H-%M-%S`

## Step 3: Engage with the User

Before writing, briefly confirm what matters. You can pre-fill from context if it's obvious (e.g., there's one in-progress bead, or the recent git diff tells the story). Otherwise ask:

1. "What were you working on?" — or state your inference and ask for confirmation
2. "Key decisions or gotchas to preserve?"
3. "What should the next session pick up?"

Keep this conversational and quick — the point is capturing context, not writing an essay.

## Step 4: Write the Handoff

Use the `Write` tool to create the file. Include these sections:

**Header**: `# Handoff: {desc}` with a metadata block showing timestamp, topic, working directory, and branch.

**"What I Was Doing"**: 1-3 sentences describing the work in progress. Be specific — mention file paths, function names, bead IDs.

**"Current State"** with two subsections:
- **Git**: repo path, branch, last commit (hash + message), summary of uncommitted changes (or "clean"). If in a worktree, note the worktree path.
- **Beads** (only if detected): open/in-progress/ready counts, list in-progress beads with IDs and titles, list ready beads.

**"Decisions & Gotchas"**: Bullet list of key decisions made this session, gotchas discovered, approaches that didn't work, things to watch out for.

**"Next Steps"**: Numbered actionable list, priority-ordered. Each step should be specific enough that a fresh session can execute without guessing.

**"Resume Recipe"**: A fenced bash block with the exact commands to restore context:
- `cd` to the working directory (or worktree path)
- `git status` and/or `git log -3 --oneline`
- `bd ready` (if beads available)
- `/resume_handoff {full-path-to-this-file}`

## Step 5: Confirm

After writing, print:

```
Handoff created: {full path}
Resume with: /resume_handoff {full path}
```
