#!/bin/bash

set -e

cd ~/sre-uber-system

echo "🔥 SAFE DAY 05 RELEASE"

# ---------------- SAFETY CHECK ----------------

echo "📌 Current branch:"
git branch --show-current

echo ""
echo "📌 Current status:"
git status

sleep 3

# ---------------- SYNC MAIN SAFELY ----------------

git checkout main
git pull origin main

# ---------------- CREATE FEATURE BRANCH ----------------

git checkout -b feature/day05-event-system

# ---------------- CREATE DAY 05 DOCS ----------------

DAY_PATH="docs/daily-log/2026-05-06_day-05"

mkdir -p "$DAY_PATH"

# ---------------- summary.md ----------------

cat > "$DAY_PATH/summary.md" << 'EOF'
# 📅 Day 05 — Event-Driven Architecture Foundation

## 🚀 What Was Implemented

- Introduced event-driven system design
- Added event.py as event producer module
- Emitted ride status change events
- Persisted events into events.log
- Connected service layer with event emission

## 🧠 System Flow

Ride Service
↓
State Change
↓
Event Emission
↓
Event Stream (events.log)

## 💡 Key Insight

Distributed systems communicate using events instead of tight coupling.
EOF

# ---------------- decisions.md ----------------

cat > "$DAY_PATH/decisions.md" << 'EOF'
# 🧠 Decisions

## 1. Simulate events before introducing Kafka
Reason:
- Understand event-driven architecture concept first
- Avoid tool memorization without system understanding

## 2. Emit events from service layer
Reason:
- Business events originate from business logic
- Keeps architecture clean
EOF

# ---------------- failures.md ----------------

cat > "$DAY_PATH/failures.md" << 'EOF'
# 💥 Failures

## 1. Confusion between logging and event systems

Initially event emission concept was unclear because:
- Kafka was not yet introduced
- events.log looked like normal logging

## Resolution
Understood that:
- events.log is temporary simulation
- real systems replace this with Kafka/PubSub
EOF

# ---------------- learnings.md ----------------

cat > "$DAY_PATH/learnings.md" << 'EOF'
# 📚 Learnings

## Event-Driven Architecture

Instead of polling databases:
- services react to emitted events

## Producer Concept

Ride service became:
- event producer

## Future Evolution

events.log will later be replaced by:
- Kafka
- Pub/Sub
- SQS/SNS

## Key Insight

Events decouple distributed systems.
EOF

# ---------------- CLEAN ----------------

rm -rf services/ride-service/__pycache__

# ---------------- STAGE ONLY IMPORTANT FILES ----------------

git add services/ride-service/event.py
git add services/ride-service/service.py
git add docs/daily-log/2026-05-06_day-05

# ---------------- VERIFY ----------------

echo ""
echo "📌 FINAL STAGED CHANGES"
git status

sleep 5

# ---------------- COMMIT ----------------

git commit -m "feat: introduce event-driven architecture foundation

- Added event producer module
- Emitted ride status change events
- Introduced event stream simulation
- Added Day 05 engineering documentation"

# ---------------- PUSH ----------------

git push origin feature/day05-event-system

echo ""
echo "✅ SAFE PUSH COMPLETE"
echo "👉 Create PR from:"
echo "feature/day05-event-system → main"
