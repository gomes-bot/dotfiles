---
name: resume_handoff
description: "Load a previous session handoff and re-establish context. Reads the handoff, gathers current state, and shows what changed since. Beads + git re-sync are optional."
allowed-tools: Read, Glob, Grep, Bash, AskUserQuestion
argument-hint: "<path|topic>"
---

# Resume Handoff

Re-establish session context from a previously created handoff document.

## Inputs

- `$ARGUMENTS`: either a **full file path** to a handoff `.md` file, or a **topic name** (folder under `~/.claude/handoffs/`)
- If empty, list all available topics and let the user pick

## Step 1: Locate the Handoff

### If argument looks like a file path (contains `/` or ends in `.md`):

Read it directly with the `Read` tool. If the file doesn't exist, tell the user and bail.

### If argument is a topic name (no `/`, doesn't end in `.md`):

Look in `~/.claude/handoffs/` for folders matching the topic. Use Glob:

```
~/.claude/handoffs/*{topic}*/*.md
```

If an exact folder match exists, use it. Otherwise, fuzzy-match and confirm with the user.

Within the matched folder:
- List all `.md` files (they're timestamp-prefixed, so alphabetical = chronological)
- Show the **last 5** handoffs with their dates and descriptions
- Auto-select the **newest** one, but ask the user if they want an older one

### If no argument provided:

List all topic folders under `~/.claude/handoffs/`:

```bash
ls -1d ~/.claude/handoffs/*/ 2>/dev/null
```

For each folder, show:
- Topic name
- Number of handoffs
- Date of the most recent one (from filename)

Ask the user to pick a topic, then proceed as above.

## Step 2: Read the Handoff

Read the selected file with the `Read` tool. Parse all sections — you'll need them for the briefing.

## Step 3: Gather Current Live State

After reading the handoff, collect **current** state to compare against what the handoff recorded.

### Git (if `git rev-parse --is-inside-work-tree 2>/dev/null` succeeds):

```bash
echo "BRANCH=$(git branch --show-current)"
echo "LAST_COMMIT=$(git log -1 --oneline)"
echo "---GIT STATUS---"
git status --short
echo "---RECENT COMMITS---"
git log -5 --oneline
```

Compare with the handoff's recorded git state — note:
- Branch changes
- New commits since the handoff
- Changed files

### Beads (if `command -v bd >/dev/null 2>&1` AND `[ -e .beads/issues.jsonl ]`):

```bash
echo "---BD STATS---"
bd stats
echo "---BD READY---"
bd ready
echo "---BD IN PROGRESS---"
bd list --status=in_progress
```

Compare with the handoff's recorded beads state — note:
- Newly opened issues
- Newly closed issues
- Newly unblocked (ready) issues
- Changes in in-progress items

## Step 4: Present the Briefing

Give the user a clear, concise briefing covering:

1. **Context restored**: What you were working on (from the handoff's "What I Was Doing" section)
2. **What changed since**: Differences in git state (new commits, branch changes) and beads state (opened/closed/unblocked issues). If nothing changed, say so — that's useful info too.
3. **Decisions & gotchas**: Key things to remember from the handoff — surface these prominently so they don't get re-learned the hard way
4. **Next steps**: From the handoff's "Next Steps" section, updated with any changes detected in the current state. Strike through steps that appear to be completed (e.g., if a bead was closed or a commit matches a step).
5. **Ready to go**: Ask if the user wants to dive into the first next step, adjust the plan, or review something first.

Keep the briefing scannable — use headers, bullets, and bold for key info. Don't just dump the raw handoff contents back.
