#!/usr/bin/env bash
# Activate lesson 02 (recursive-ctes) into main.sql for website grading.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cp "$ROOT/lessons/02-recursive-ctes/main.sql" "$ROOT/main.sql"
echo "Active: 02-recursive-ctes → main.sql"
echo "Next: git add -A && git commit -m 'lesson 02' && git push"
echo "Then: Check my solution on the lesson page."
