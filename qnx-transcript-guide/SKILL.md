---
name: qnx-transcript-guide
description: Convert raw QNX course lesson transcripts (especially Markdown `.md` files) into concise, professional study guides that maximize practical learning in minimum time. Use when a user shares a lesson transcript, module notes, or long lecture text and asks for a distilled guide with key concepts, mental models, diagrams, practical examples, and pitfalls.
---

# QNX Transcript Guide

## Overview

Create compact, high-yield study guides from long QNX lesson transcripts. Apply Pareto filtering internally to keep only the highest-value ideas, then present the result in a scan-friendly format with one diagram and concrete examples.

## Inputs To Collect

- Raw transcript in `.md` (required)
- Lesson or module title (if available)
- User focus (for example: IPC, scheduling, synchronization, resource managers, debugging)
- User's requested depth (default: concise)

If metadata is missing, infer from transcript content and state assumptions briefly.

## Workflow

1. Identify the objective of the lesson in one sentence.
2. Extract candidate points:
   - repeated ideas
   - instructor emphasis ("important", "common mistake", "remember")
   - concepts tied to labs/exercises
   - concepts with operational impact in production systems
3. Rank points by leverage:
   - frequency in transcript
   - dependency value (prerequisite for many later topics)
   - real-world failure risk if misunderstood
4. Keep only top-leverage content; trim low-yield details.
5. Build one mental model diagram (Mermaid preferred; ASCII fallback if needed).
6. Add practical examples:
   - at least one code-level example (C/QNX flavored when possible)
   - at least one scenario-level example (what happens in a real system)
7. End after key pitfalls; do not add quizzes, revision tests, or study plans.

## Output Rules

- Default length target: 350-700 words.
- If transcript is very short, keep output proportional.
- Prefer bullets, short paragraphs, and concrete language.
- Do not copy long transcript passages verbatim.
- Keep tone professional and practical.
- Include exactly what helps retention and execution; avoid filler theory.

## Required Output Structure

Follow this structure in order:

1. `Lesson Snapshot` (3-5 bullets)
   - what this lesson is about
   - why it matters in real QNX systems
2. `Core Concepts`
   - 4-7 concepts only
   - each concept: 1-2 lines + "Why this matters"
3. `Mental Model Diagram`
   - embed one Mermaid diagram
   - use a pattern from `references/diagram-patterns.md`
4. `Worked Examples`
   - Example A: code-oriented
   - Example B: system behavior / troubleshooting
5. `Common Pitfalls`
   - 3-5 high-risk misunderstandings

## QNX-Specific Guidance

- Favor examples around:
  - process vs thread behavior
  - priority and scheduling effects
  - IPC and synchronization tradeoffs
  - deterministic timing and latency
  - debugging and observability
- When possible, map concepts to likely QNX APIs/commands without overloading details.
- Call out real-time implications explicitly (deadline misses, inversion risk, jitter, blocking).

## Diagram Requirements

- Prefer Mermaid `flowchart` or `sequenceDiagram`.
- Keep diagrams simple enough to read in under 20 seconds.
- Label nodes with QNX terms used in the lesson.
- Include one-sentence interpretation directly below the diagram.

## Quality Bar

Before finalizing, verify the guide is:
- concise (not bloated)
- technically accurate relative to transcript
- biased toward practical application
- optimized for revision speed
- complete enough that the learner can act immediately
- free of quizzes, flashcards, and time-based study plans

## References

- Use `references/guide-template.md` for the final output skeleton.
- Use `references/diagram-patterns.md` to pick diagram types quickly.
