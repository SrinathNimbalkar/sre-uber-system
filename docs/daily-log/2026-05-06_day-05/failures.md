# 💥 Failures

## 1. Confusion between logging and event systems

Initially event emission concept was unclear because:
- Kafka was not yet introduced
- events.log looked like normal logging

## Resolution
Understood that:
- events.log is temporary simulation
- real systems replace this with Kafka/PubSub
