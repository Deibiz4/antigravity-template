# Core Project Management Skill

This skill defines the core behavior and interaction patterns for this project.

## Project Information

- **Name**: Antigravity Template
- **Version**: 1.0.0
- **Purpose**: A template for standardized project documentation and management using Antigravity.

## Expected Behavior

### At Session start
- Read `docs/LOGS.md` to understand the project's current state.
- Check `docs/CHANGELOG.md` for the current version.
- Follow the defined code conventions.

### During Development
- Maintain consistency with existing code.
- Confirm before making destructive or irreversible changes.
- Do not modify files in `.agent/` unless explicitly requested.

### At Session end
- Update `docs/LOGS.md` with a summary of the session using the `/log-session` workflow.
- Update `docs/CHANGELOG.md` if there are releaseable changes using `/update-changelog`.
- Update `docs/MANUAL.md` if new functionality was added using `/document-feature`.

## Documentation Rules
- Always use Spanish for documentation content (LOGS, MANUAL, CHANGELOG).
- Keep entries concise and well-formatted.
