#!/usr/bin/env bash
# Activate lesson 05 (views) into main.sql for website grading.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cp "$ROOT/lessons/05-views/main.sql" "$ROOT/main.sql"
echo "Active: 05-views → main.sql"
echo "Next: git add -A && git commit -m 'lesson 05' && git push"
echo "Then: Check my solution on the lesson page."
