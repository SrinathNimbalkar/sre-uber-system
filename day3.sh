#!/bin/bash
set -e

cd ~/sre-uber-system

echo "🔥 Creating Day 03..."

mkdir -p docs/daily-log/2026-04-27_day-03

# ---------------- SUMMARY ----------------
cat > docs/daily-log/2026-04-27_day-03/summary.md << 'EOF'
# 📅 Day 03 — System Behavior (State Machine)

## 🎯 Objective
Transform system from data storage to behavior enforcement.

## 🚀 What Was Done
- Introduced state machine concept
- Defined ride lifecycle:
  requested → assigned → in_progress → completed → paid
- Understood valid vs invalid transitions
- Refactored system into:
  Controller → Service → Repository

## 🧠 System Thinking
A system is not just storing data.
It must control how data changes.

## 🔥 Flow
Request → Service Layer → Validate → Update DB

## 💡 Insight
Without rules, system becomes inconsistent.
EOF

# ---------------- DECISIONS ----------------
cat > docs/daily-log/2026-04-27_day-03/decisions.md << 'EOF'
# 🧠 Decisions

- Introduced service layer for business logic
- Moved DB operations into repository layer
- Defined strict state transitions
- Avoided putting logic inside Flask routes

## Reason
Clear separation:
- improves maintainability
- avoids chaos in scaling
EOF

# ---------------- FAILURES ----------------
cat > docs/daily-log/2026-04-27_day-03/failures.md << 'EOF'
# 💥 Failures

- Confused flow with allowed transitions
- Initially assumed system follows sequence automatically

## Correction
System must enforce rules:
Current State → Allowed Next States

## Insight
Without validation, system accepts invalid states.
EOF

# ---------------- LEARNINGS ----------------
cat > docs/daily-log/2026-04-27_day-03/learnings.md << 'EOF'
# 📚 Learnings

## State Machine
Defines allowed transitions between states

## Architecture
Controller → handles API
Service → business rules
Repository → DB operations

## Key Insight
Correct systems enforce rules, not just process requests

## Deep Thinking
A request is a controlled state transition, not just execution
EOF

# ---------------- GIT ----------------
git add docs/daily-log/2026-04-27_day-03

git commit -m "docs: Day 03 - state machine and system behavior

- Introduced state machine concept
- Defined ride lifecycle transitions
- Refactored into layered architecture
- Shifted thinking from data → behavior"

git push origin main

echo "✅ Day 03 pushed"
