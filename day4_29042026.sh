#!/bin/bash
set -e

cd ~/sre-uber-system

echo "🔥 Day 04 FULL SYNC (code + docs)"

# ---------------- CREATE DAY 04 ----------------
DAY_PATH="docs/daily-log/2026-04-29_day-04"
mkdir -p $DAY_PATH

# ---------------- SUMMARY ----------------
cat > $DAY_PATH/summary.md << 'EOF'
# 📅 Day 04 — System Recovery + State Machine Implementation

## 🎯 Objective
Recover lost code and enforce correct system behavior.

## 🚀 What Was Done

### 1. Code Recovery
- Rebuilt ride-service after accidental Git overwrite
- Restored:
  - app.py
  - service.py
  - repository.py
  - db.py

### 2. Architecture Upgrade
- Introduced layered design:
  Controller → Service → Repository → DB
- Removed direct DB access from routes

### 3. State Machine Implementation
- Defined lifecycle:
  requested → assigned → in_progress → completed → paid
- Enforced strict transitions

### 4. System Validation
- Tested valid flows (assign → start → complete → pay)
- Tested invalid flow (requested → paid → blocked)

### 5. Git Failure Realization
- Code lost due to partial commit
- Understood importance of syncing code + docs

## 🧠 Insight
System correctness = behavior enforcement + version control discipline
EOF

# ---------------- DECISIONS ----------------
cat > $DAY_PATH/decisions.md << 'EOF'
# 🧠 Decisions

- Introduced service + repository layers
- Enforced state machine in service layer
- Removed business logic from Flask routes
- Adopted strict Git discipline (code + docs together)

## Reason
To ensure system consistency, scalability, and maintainability
EOF

# ---------------- FAILURES ----------------
cat > $DAY_PATH/failures.md << 'EOF'
# 💥 Failures

- Lost backend code due to improper Git commit
- Pushed only documentation earlier
- Caused mismatch between repo and actual system

## Root Cause
Lack of verification before commit

## Fix
Rebuilt system and enforced commit discipline
EOF

# ---------------- LEARNINGS ----------------
cat > $DAY_PATH/learnings.md << 'EOF'
# 📚 Learnings

## System Design
- Data storage is not enough → behavior must be controlled
- State machine ensures valid system transitions

## Architecture
- Controller → handles HTTP
- Service → enforces rules
- Repository → DB interaction

## Git Discipline
- Uncommitted code = lost code
- Repo must reflect actual system state

## Key Insight
A reliable system requires:
- strict state control
- disciplined version control
EOF

# ---------------- CLEAN ----------------
rm -rf services/ride-service/__pycache__

# ---------------- STAGE ----------------
git add services/
git add docs/
git add architecture/
git add README.md

# ---------------- VERIFY ----------------
echo "📌 Final check:"
git status
sleep 3

# ---------------- COMMIT ----------------
git commit -m "fix: Day 04 full system recovery + state machine + documentation

- Rebuilt backend after code loss
- Implemented layered architecture
- Enforced state machine transitions
- Verified valid and invalid flows
- Added Day 04 logs (real system + Git failure)

Rule:
Code and documentation must always stay in sync"

# ---------------- PUSH ----------------
git push origin main

echo "✅ Day 04 code + docs synced to main"
echo "⚠️ From tomorrow: ONLY branch → PR flow"
