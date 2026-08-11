#!/usr/bin/env bash
# Activate lesson 03 (window-frames) into main.sql for website grading.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cp "$ROOT/lessons/03-window-frames/main.sql" "$ROOT/main.sql"
echo "Active: 03-window-frames → main.sql"
echo "Next: git add -A && git commit -m 'lesson 03' && git push"
echo "Then: Check my solution on the lesson page."
