# 🧠 Decisions

## 1. Introduce Event Table

Reason:
Build async mental model before introducing Kafka complexity.

---

## 2. Separate Event Creation

Reason:
Ride service should emit work, not process all downstream logic directly.

---

## 3. Repository Owns DB Connections

Reason:
Maintain proper layered architecture boundaries.

---

## 4. Introduce Async Payment Flow

Reason:
Reduce synchronous coupling between services.
