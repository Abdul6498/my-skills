#!/usr/bin/env bash

set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
DEST_DIR="$CODEX_HOME/skills"

DRY_RUN=0
SKILL_NAME=""

usage() {
  cat <<'EOF'
Usage:
  ./sync-skills.sh [--all] [--skill <name>] [--dry-run]

Description:
  Install or update local skills from this my-skills folder into:
  $CODEX_HOME/skills (default: ~/.codex/skills)

Options:
  --all           Sync all local skills (default behavior)
  --skill <name>  Sync only one skill folder
  --dry-run       Print what would change without writing
  -h, --help      Show help
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --all)
      shift
      ;;
    --skill)
      SKILL_NAME="${2:-}"
      if [[ -z "$SKILL_NAME" ]]; then
        echo "Error: --skill requires a value."
        exit 1
      fi
      shift 2
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Error: Unknown option: $1"
      usage
      exit 1
      ;;
  esac
done

if ! command -v rsync >/dev/null 2>&1; then
  echo "Error: rsync is required but not installed."
  exit 1
fi

mkdir -p "$DEST_DIR"

discover_skills() {
  find "$SOURCE_DIR" -mindepth 1 -maxdepth 1 -type d \
    ! -name ".git" \
    -exec test -f "{}/SKILL.md" ';' -print | sort
}

SYNC_COUNT=0

sync_one_skill() {
  local src="$1"
  local name
  name="$(basename "$src")"
  local dst="$DEST_DIR/$name"

  echo "Syncing skill: $name"

  local -a rsync_args=(
    -a
    --delete
    --exclude ".git/"
    --exclude ".DS_Store"
    "$src/"
    "$dst/"
  )

  if [[ "$DRY_RUN" -eq 1 ]]; then
    rsync_args=(-anv "${rsync_args[@]}")
  fi

  rsync "${rsync_args[@]}"
  SYNC_COUNT=$((SYNC_COUNT + 1))
}

if [[ -n "$SKILL_NAME" ]]; then
  SKILL_PATH="$SOURCE_DIR/$SKILL_NAME"
  if [[ ! -d "$SKILL_PATH" || ! -f "$SKILL_PATH/SKILL.md" ]]; then
    echo "Error: Skill '$SKILL_NAME' not found in $SOURCE_DIR or missing SKILL.md."
    exit 1
  fi
  sync_one_skill "$SKILL_PATH"
else
  while IFS= read -r skill_path; do
    sync_one_skill "$skill_path"
  done < <(discover_skills)
fi

if [[ "$SYNC_COUNT" -eq 0 ]]; then
  echo "No local skills found in $SOURCE_DIR."
  exit 0
fi

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "Dry run complete. Skills checked: $SYNC_COUNT"
else
  echo "Sync complete. Skills installed/updated: $SYNC_COUNT"
  echo "Restart Codex to pick up new skills."
fi
