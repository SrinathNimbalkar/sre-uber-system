# 📚 Learnings

## Event-Driven Architecture

Services emit events instead of synchronously performing all work.

---

## Producer

A producer creates asynchronous work items.

In this project:
Ride Service became event producer.

---

## Event Queue Concept

The events table temporarily simulates:
- Kafka topic
- distributed queue

---

## Async Processing

Heavy or delayed work should move into:
- background workers
- consumers

This reduces:
- request latency
- thread blocking
- failure propagation

---

## Key Insight

Modern distributed systems communicate through events, not only direct synchronous API calls.
