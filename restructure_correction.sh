#!/bin/bash

set -e

cd ~/sre-uber-system

echo "🔥 Writing structured logs with real content..."

# -----------------------
# DAY 01
# -----------------------

cat > docs/daily-log/2026-04-20_day-01/summary.md << 'EOF'
# 📅 Day 01 — 2026-04-20

## 🚀 What I Did
- Set up GitHub repository for SRE Uber system
- Configured SSH authentication (personal vs work separation)
- Established structured project layout
- Prepared development environment (Mac + Ubuntu VM)

## 🧠 Key Concepts
- Git = system memory (version control)
- SSH = secure identity layer
- Repository = foundation for system evolution

## 🔥 System View
Developer → Git → Remote Repo → Version Control → Collaboration

## 💡 Insight
Before building distributed systems, identity, access, and structure must be correct.
EOF

cat > docs/daily-log/2026-04-20_day-01/decisions.md << 'EOF'
# 🧠 Decisions

## 1. Separate personal and work GitHub identities
Reason:
- Avoid conflicts
- Maintain clean history

## 2. Use SSH instead of HTTPS
Reason:
- Secure authentication
- No repeated credentials

## 3. Structured documentation from Day 1
Reason:
- Avoid chaos later
- Enable long-term traceability
EOF

cat > docs/daily-log/2026-04-20_day-01/failures.md << 'EOF'
# 💥 Failures

## 1. GitHub SSH confusion
Cause:
- Wrong host format

Fix:
- Used SSH alias properly

---

## 2. VM authentication failure
Cause:
- SSH key not configured

Fix:
- Generated key and added to GitHub

---

## 🔥 Learning
Environment setup is part of system design, not a trivial step.
EOF

cat > docs/daily-log/2026-04-20_day-01/learnings.md << 'EOF'
# 📚 Learnings

## Git
- Tracks system evolution

## SSH
- Provides secure identity

## Insight
Every system starts with:
- Identity
- Access
- Structure
EOF

# -----------------------
# DAY 02 (MERGED STORY)
# -----------------------

cat > docs/daily-log/2026-04-21_day-02/summary.md << 'EOF'
# 📅 Day 02 — 2026-04-21

## 🚀 What I Built

### Phase 1 — Understanding System Flow
- Built simple frontend (HTML + JS)
- Built backend (Flask API)
- Connected backend to PostgreSQL
- Verified communication using browser and curl

Flow:
Frontend → Backend API → Database → Response

---

### Phase 2 — Debugging Real System Issues
- Fixed CORS issues
- Resolved firewall (UFW) blocking ports
- Understood difference between localhost vs VM IP

---

### Phase 3 — Building Ride Service
- Created Ride Service (Flask)
- Integrated PostgreSQL
- Implemented APIs:
  - Create Ride
  - Fetch Ride

---

## 🧠 System Flow

Client → API → Service → Database → Sequence → Response

---

## 🔥 Key Concepts
- API = contract between systems
- Database = source of truth
- Sequence = unique ID generator
- Network = critical layer for communication

---

## 💡 Insight
Even a simple request flows through:
network → application → database → kernel → response
EOF

cat > docs/daily-log/2026-04-21_day-02/decisions.md << 'EOF'
# 🧠 Decisions

## 1. Start with simple frontend-backend-db system
Reason:
- Understand real data flow before scaling

## 2. Use PostgreSQL
Reason:
- Strong consistency
- Structured schema

## 3. Create dedicated DB user
Reason:
- Security best practice

## 4. Build Ride Service as separate module
Reason:
- Move toward microservices architecture
EOF

cat > docs/daily-log/2026-04-21_day-02/failures.md << 'EOF'
# 💥 Failures

## 1. CORS issue
Cause:
- Browser blocked cross-origin request

Fix:
- Enabled Flask-CORS

---

## 2. UFW blocking ports
Cause:
- Firewall restrictions

Fix:
- Allowed ports 5000 and 8080

---

## 3. PostgreSQL authentication failure
Cause:
- Incorrect user/password setup

Fix:
- Created sre_user with password

---

## 4. Sequence permission error
Cause:
- Table permission ≠ sequence permission

Fix:
- Granted privileges on sequences

---

## 🔥 Learning
Failures happen across layers:
- Network
- Security
- Database
- Application
EOF

cat > docs/daily-log/2026-04-21_day-02/learnings.md << 'EOF'
# 📚 Learnings

## API
- Defines how systems communicate

## Database
- Stores system state

## Sequence
- Generates unique IDs safely

## Networking
- localhost is not externally accessible
- firewall impacts communication

## Key Insight
INSERT is not simple:
INSERT = sequence + permissions + transaction

## System Thinking
A request travels through:
- network
- backend
- database
- kernel
EOF

# -----------------------
# GIT PUSH
# -----------------------

git add .
git commit -m "Day 01 & Day 02 structured logs with real system flow (frontend → backend → DB → ride service)"
git push origin main

echo "✅ Documentation updated and pushed"
