# API Integration

Use APIs as optional adapters, never as hard dependencies in core logic.

## Integration Strategy

1. Define client interface in `data/api_clients/base.py`.
2. Implement one provider adapter at a time.
3. Keep retries/timeouts in adapter layer.
4. Cache responses locally to reduce latency and rate-limit issues.
5. Provide offline fallback to local store.

## Adapter Protocol Example

```python
from typing import Protocol

class LexiconClient(Protocol):
    def lookup(self, term: str, source_lang: str, target_lang: str) -> dict: ...
```

## Config Keys

- `API_PROVIDER`
- `API_BASE_URL`
- `API_KEY`
- `API_TIMEOUT_SECONDS`
- `CACHE_TTL_SECONDS`

Store secrets in environment variables and document them.

## Failure Handling

- If API fails, continue with cached/local data.
- Log failure cause without exposing secrets.
- Surface a user-friendly fallback message in popup UI.
