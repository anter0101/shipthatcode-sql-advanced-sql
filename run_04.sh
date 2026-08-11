#!/usr/bin/env bash
# Activate lesson 04 (json) into main.sql for website grading.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cp "$ROOT/lessons/04-json/main.sql" "$ROOT/main.sql"
echo "Active: 04-json → main.sql"
echo "Next: git add -A && git commit -m 'lesson 04' && git push"
echo "Then: Check my solution on the lesson page."
