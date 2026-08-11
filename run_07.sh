#!/usr/bin/env bash
# Activate lesson 07 (explain) into main.sql for website grading.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cp "$ROOT/lessons/07-explain/main.sql" "$ROOT/main.sql"
echo "Active: 07-explain → main.sql"
echo "Next: git add -A && git commit -m 'lesson 07' && git push"
echo "Then: Check my solution on the lesson page."
