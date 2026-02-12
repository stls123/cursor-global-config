---
name: migrate-to-skills
description: Convert 'Applied intelligently' Cursor rules (.cursor/rules/*.mdc) and slash commands (.cursor/commands/*.md) to Agent Skills format (.cursor/skills/). Use when the user wants to migrate rules or commands to skills, convert .mdc rules to SKILL.md format, or consolidate commands into the skills directory.
disable-model-invocation: true
---
# Migrate Rules and Slash Commands to Skills

Convert Cursor rules ("Applied intelligently") and slash commands to Agent Skills format.

**CRITICAL: Preserve the exact body content. Do not modify, reformat, or "improve" it - copy verbatim.**

## Locations

| Level | Source | Destination |
|-------|--------|-------------|
| Project | `{workspaceFolder}/**/.cursor/rules/*.mdc`, `{workspaceFolder}/.cursor/commands/*.md` | `.cursor/skills/` |
| User | `~/.cursor/commands/*.md` | `~/.cursor/skills/` |

- Ignore ~/.cursor/worktrees and ~/.cursor/skills-cursor.

## Finding Files to Migrate

**Rules**: Migrate if rule has a `description` but NO `globs` and NO `alwaysApply: true`.
**Commands**: Migrate all - they're plain markdown without frontmatter.

## Conversion Format

### Rules: .mdc → SKILL.md

Add `name` field, remove `globs`/`alwaysApply`, keep body exactly.

### Commands: .md → SKILL.md

Add frontmatter with `name` (from filename), `description` (infer from content), and `disable-model-invocation: true`, keep body exactly.

## Workflow

1. Create the skills directories if they don't exist
2. Find files to migrate in project and user directories
3. For each file, read it, write the new skill file preserving body content EXACTLY, then delete the original
4. Summarize results. If user asks to undo, restore original files.

**CRITICAL: Copy the body content character-for-character. Do not reformat, fix typos, or "improve" anything.**
