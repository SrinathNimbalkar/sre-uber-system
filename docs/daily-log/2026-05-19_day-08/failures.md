# 💥 Failures

## 1. Incorrect Repository Layer Usage

Initial implementation attempted:
create_event(conn, ride_id, ...)

Problem:
Service layer no longer owned DB connection.

Fix:
Repository functions now manage their own DB lifecycle.

---

## 2. Architecture Confusion

System architecture evolved from:
simple procedural flow

into:
layered service/repository/event architecture

This caused temporary confusion around ownership boundaries.

---

## 🔥 Learning

Good architecture clearly separates:
- business logic
- persistence logic
- event generation
