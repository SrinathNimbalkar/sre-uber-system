#!/bin/bash

set -e

echo "🚀 Restructuring documentation..."

# Go to repo root
cd ~/sre-uber-system

# Create new structure
mkdir -p docs/daily-log/2026-04-20_day-01
mkdir -p docs/daily-log/2026-04-21_day-02

# Move old day-01.md into proper structure as summary
if [ -f docs/daily-log/day-01.md ]; then
    mv docs/daily-log/day-01.md docs/daily-log/2026-04-20_day-01/summary.md
fi

# Create required files for Day 01
touch docs/daily-log/2026-04-20_day-01/decisions.md
touch docs/daily-log/2026-04-20_day-01/failures.md
touch docs/daily-log/2026-04-20_day-01/learnings.md

# Create files for Day 02
touch docs/daily-log/2026-04-21_day-02/summary.md
touch docs/daily-log/2026-04-21_day-02/decisions.md
touch docs/daily-log/2026-04-21_day-02/failures.md
touch docs/daily-log/2026-04-21_day-02/learnings.md

# Remove old flat files (cleanup)
rm -f docs/decisions.md docs/failures.md docs/learnings.md

echo "✅ Structure created successfully"

# Git operations
git add .
git commit -m "Restructured docs: introduced daily structured logs (Day 01 + Day 02)"
git push origin main

echo "🚀 Changes pushed to GitHub"
