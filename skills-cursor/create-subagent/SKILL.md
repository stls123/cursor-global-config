---
name: create-subagent
description: Create custom subagents for specialized AI tasks. Use when the user wants to create a new type of subagent, set up task-specific agents, configure code reviewers, debuggers, or domain-specific assistants with custom prompts.
disable-model-invocation: true
---
# Creating Custom Subagents

This skill guides you through creating custom subagents for Cursor. Subagents are specialized AI assistants that run in isolated contexts with custom system prompts.

## When to Use Subagents

Subagents help you:
- **Preserve context** by isolating exploration from your main conversation
- **Specialize behavior** with focused system prompts for specific domains
- **Reuse configurations** across projects with user-level subagents

## Subagent Locations

| Location | Scope | Priority |
|----------|-------|----------|
| `.cursor/agents/` | Current project | Higher |
| `~/.cursor/agents/` | All your projects | Lower |

**Project subagents** (`.cursor/agents/`): Ideal for codebase-specific agents. Check into version control to share with your team.

**User subagents** (`~/.cursor/agents/`): Personal agents available across all your projects.

## Subagent File Format

Create a `.md` file with YAML frontmatter and a markdown body (the system prompt). Required fields: `name` (lowercase, hyphens), `description` (when to delegate - be specific).

## Writing Effective Descriptions

The description is **critical** - the AI uses it to decide when to delegate. Include "use proactively" to encourage automatic delegation.

## Best Practices

1. **Design focused subagents**: Each should excel at one specific task
2. **Write detailed descriptions**: Include trigger terms so the AI knows when to delegate
3. **Check into version control**: Share project subagents with your team
4. **Use proactive language**: Include "use proactively" in descriptions

## Troubleshooting

- Ensure file is in `.cursor/agents/` or `~/.cursor/agents/`
- Check file has `.md` extension
- Verify YAML frontmatter syntax is valid
