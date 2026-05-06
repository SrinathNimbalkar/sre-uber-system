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
