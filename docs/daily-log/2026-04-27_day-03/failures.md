# 💥 Failures

- Confused flow with allowed transitions
- Initially assumed system follows sequence automatically

## Correction
System must enforce rules:
Current State → Allowed Next States

## Insight
Without validation, system accepts invalid states.
