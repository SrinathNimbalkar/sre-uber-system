from flask import Flask, request, jsonify
from db import get_connection

app = Flask(__name__)

# Create Ride
@app.route("/ride", methods=["POST"])
def create_ride():
    data = request.json

    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        INSERT INTO rides (user_id, pickup_location, drop_location, status)
        VALUES (%s, %s, %s, %s)
        RETURNING ride_id
    """, (data["user_id"], data["pickup"], data["drop"], "requested"))

    ride_id = cur.fetchone()[0]
    conn.commit()

    cur.close()
    conn.close()

    return jsonify({"ride_id": ride_id, "status": "requested"})

# Get Ride
@app.route("/ride/<int:ride_id>", methods=["GET"])
def get_ride(ride_id):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT * FROM rides WHERE ride_id = %s", (ride_id,))
    ride = cur.fetchone()

    cur.close()
    conn.close()

    if not ride:
        return jsonify({"error": "Ride not found"}), 404

    return jsonify({"ride": ride})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
