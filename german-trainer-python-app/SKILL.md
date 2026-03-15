---
name: german-trainer-python-app
description: Build a modular Python desktop application for German learning with timed popup exercises (vocabulary, translation, sentence building, article practice, fill-in-the-blank, and grammar drills), extensible architecture, and clean documentation. Use when a user asks to create or evolve a German-learning app codebase, design plugin-like exercise modes, integrate APIs, or produce maintainable project docs.
---

# German Trainer Python App

## Overview

Use this skill to design and implement a maintainable Python app that interrupts the day with short German exercises. Optimize for fast iteration, extensibility, and documentation quality so new features (including APIs) can be added without rewrites.

## Core Capabilities

1. Define a modular architecture for popup-based language practice.
2. Implement multiple exercise modes with shared interfaces.
3. Add pluggable data sources (local files first, APIs later).
4. Maintain clean project documentation for setup, architecture, and roadmap.

## Implementation Workflow

1. Translate user goals into a feature slice:
   - timed popup interval
   - question type
   - answer validation
   - feedback behavior
2. Start with the blueprint in `references/project-blueprint.md`.
3. Implement one vertical feature end-to-end before adding more modes.
4. Add exercise modes via the mode contracts in `references/exercise-modes.md`.
5. Add API integration through adapters in `references/api-integration.md`.
6. Keep docs current using `references/documentation-pack.md`.
7. Add/maintain tests around scoring, validation, and scheduling logic.

## Build Rules

- Use Python 3.11+ and type hints.
- Keep UI, domain logic, and data adapters separate.
- Design new exercises as plugins, not condition-heavy branching.
- Default to local data store first; hide API dependencies behind interfaces.
- Keep functions/classes small and testable.
- Document every new module and public interface.

## Output Expectations For This Skill

When using this skill, produce:
- working code changes
- short architecture notes for design decisions
- updated docs files from the documentation pack
- a quick "next extension" section for future features

## Minimum Feature Set (MVP)

Implement these first:
1. Popup scheduler that triggers exercises at configurable intervals.
2. Vocabulary translation mode (DE<->EN).
3. Sentence creation mode from prompt words.
4. Article practice mode (`der/die/das`).
5. Fill-in-the-blank mode with answer checking.
6. Progress tracking (attempts, correct rate, streak).

## Documentation Standard

Always maintain:
- setup/run instructions
- architecture and module boundaries
- config and environment keys
- feature roadmap and changelog notes

Use `references/documentation-pack.md` as the checklist.

## References

- `references/project-blueprint.md` for folders, module boundaries, and interfaces.
- `references/exercise-modes.md` for question types and plugin contracts.
- `references/api-integration.md` for adding external APIs safely.
- `references/documentation-pack.md` for required docs and quality checks.
