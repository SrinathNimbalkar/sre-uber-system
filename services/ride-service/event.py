from datetime import datetime

def emit_event(event_type, ride_id, old_status, new_status):

    timestamp = datetime.utcnow().isoformat()

    event = {
        "timestamp": timestamp,
        "event_type": event_type,
        "ride_id": ride_id,
        "old_status": old_status,
        "new_status": new_status
    }

    print(f"[EVENT EMITTED] {event}")

    with open("events.log", "a") as f:
        f.write(f"{event}\n")
