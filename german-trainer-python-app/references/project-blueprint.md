# Project Blueprint

Use this as the default structure for the German learning app.

## Suggested Layout

```text
german_trainer/
  pyproject.toml
  src/
    german_trainer/
      app.py
      config.py
      domain/
        models.py
        scoring.py
        scheduler.py
      exercises/
        base.py
        translation.py
        sentence_builder.py
        article_practice.py
        fill_blank.py
      data/
        repository.py
        local_store.py
        api_clients/
          base.py
          dict_api.py
      ui/
        popup.py
        components.py
      services/
        session_service.py
        feedback_service.py
  tests/
    test_scoring.py
    test_scheduler.py
    test_exercises.py
  docs/
    setup.md
    architecture.md
    roadmap.md
```

## Module Boundaries

- `domain/`: pure logic only; no UI or network.
- `exercises/`: each mode implements the same interface.
- `data/`: source adapters (JSON/CSV/APIs).
- `ui/`: popup rendering and user input.
- `services/`: use-case orchestration.

## Interface Pattern

```python
from dataclasses import dataclass
from typing import Protocol

@dataclass
class Question:
    prompt: str
    answer: str
    metadata: dict[str, str]

class ExerciseMode(Protocol):
    name: str
    def next_question(self) -> Question: ...
    def check(self, user_answer: str, question: Question) -> bool: ...
```

Use this protocol for every new exercise mode.
