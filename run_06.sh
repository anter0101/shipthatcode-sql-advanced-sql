#!/usr/bin/env bash
# Activate lesson 06 (triggers) into main.sql for website grading.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cp "$ROOT/lessons/06-triggers/main.sql" "$ROOT/main.sql"
echo "Active: 06-triggers → main.sql"
echo "Next: git add -A && git commit -m 'lesson 06' && git push"
echo "Then: Check my solution on the lesson page."
