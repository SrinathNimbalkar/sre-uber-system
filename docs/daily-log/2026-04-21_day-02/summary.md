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
