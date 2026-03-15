# Diagram Patterns For QNX Lesson Guides

Use one pattern per guide. Keep diagram small and readable.

## 1) Concept Flow (default)

Use when explaining cause-and-effect.

```mermaid
flowchart LR
    A[Input/Event] --> B[Kernel/Scheduler]
    B --> C[Thread or Process Action]
    C --> D[IPC/Sync]
    D --> E[Observed Behavior]
```

## 2) State Progression

Use when a thread/process changes state over time.

```mermaid
stateDiagram-v2
    [*] --> READY
    READY --> RUNNING: dispatched
    RUNNING --> BLOCKED: waits on resource/msg
    BLOCKED --> READY: unblocked
    RUNNING --> [*]: completed
```

## 3) Request/Reply IPC

Use when describing message-passing or service interactions.

```mermaid
sequenceDiagram
    participant C as Client
    participant S as Server
    participant K as Kernel
    C->>K: send request
    K->>S: deliver message
    S->>K: send reply
    K->>C: wake and return reply
```

## 4) Priority Interaction

Use when explaining scheduling and inversion risk.

```mermaid
flowchart TD
    H[High Priority Thread] -->|needs lock| L[Shared Lock]
    M[Medium Priority Thread] --> CPU[CPU Time]
    LL[Low Priority Thread holds lock] --> L
    L --> H
```

Below the diagram, add a one-sentence explanation that states the practical consequence.
