# Documentation Pack

When creating or updating the app, keep these docs current.

## Required Docs

1. `docs/setup.md`
- prerequisites
- install steps
- run commands
- environment variables

2. `docs/architecture.md`
- module map
- data flow (question generation -> answer -> scoring)
- extension points for new modes and APIs

3. `docs/roadmap.md`
- implemented features
- next features
- known gaps/tech debt

## Documentation Quality Checks

- Commands are copy-paste runnable.
- Config variable names match actual code.
- Folder structure in docs matches repo.
- New mode/API includes one short usage example.
- Known limitations are explicit.

## Commit Rule

For feature commits, update docs in the same change unless explicitly postponed.
