#!/usr/bin/env bash
# Activate lesson 01 (indexes) into main.sql for website grading.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cp "$ROOT/lessons/01-indexes/main.sql" "$ROOT/main.sql"
echo "Active: 01-indexes → main.sql"
echo "Next: git add -A && git commit -m 'lesson 01' && git push"
echo "Then: Check my solution on the lesson page."
