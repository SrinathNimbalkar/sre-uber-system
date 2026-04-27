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
