# Exercise Modes

Start with short exercises that fit popup usage (15-60 seconds).

## Required Modes

1. Translation
- Prompt DE word -> answer EN, and reverse mode.
- Accept normalized answers (case-insensitive, trimmed).

2. Sentence Builder
- Prompt includes 1-3 required words.
- User writes one short sentence.
- Validate required words appear; optional grammar check later.

3. Article Practice
- Prompt noun only.
- User selects `der`, `die`, or `das`.

4. Fill in the Blank
- Show sentence with one token masked.
- User supplies missing word.

## Mode Contract

Each mode should expose:
- `next_question()`
- `check(user_answer, question)`
- `hint(question)` (optional)
- `explain(question)` (optional)

## Validation Rules

- Keep strictness configurable (`strict`, `normal`, `lenient`).
- Normalize umlauts and ß based on mode settings.
- Return structured feedback:
  - `is_correct`
  - `expected`
  - `explanation`

## Progress Tracking Fields

- attempts
- correct
- streak
- last_seen_at
- weak_tags (for spaced repetition later)
