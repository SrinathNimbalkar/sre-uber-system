from db import get_connection

def create_ride(user_id, pickup, drop):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        INSERT INTO rides (user_id, pickup_location, drop_location, status)
        VALUES (%s, %s, %s, %s)
        RETURNING ride_id
    """, (user_id, pickup, drop, "requested"))

    ride_id = cur.fetchone()[0]
    conn.commit()

    cur.close()
    conn.close()

    return ride_id


def get_ride(ride_id):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT ride_id, status FROM rides WHERE ride_id = %s", (ride_id,))
    result = cur.fetchone()

    cur.close()
    conn.close()

    return result


def update_status(ride_id, status):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute(
        "UPDATE rides SET status = %s WHERE ride_id = %s",
        (status, ride_id)
    )

    conn.commit()

    cur.close()
    conn.close()
