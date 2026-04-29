# app.py

from flask import Flask, request, jsonify
from service import create_ride_service, get_ride_service, update_ride_status

app = Flask(__name__)


@app.route("/ride", methods=["POST"])
def create_ride():
    data = request.json
    return jsonify(create_ride_service(data))


@app.route("/ride/<int:ride_id>", methods=["GET"])
def get_ride(ride_id):
    ride = get_ride_service(ride_id)

    if not ride:
        return jsonify({"error": "Ride not found"}), 404

    return jsonify(ride)


@app.route("/ride/<int:ride_id>/assign", methods=["POST"])
def assign(ride_id):
    return update_ride_status(ride_id, "assigned")


@app.route("/ride/<int:ride_id>/start", methods=["POST"])
def start(ride_id):
    return update_ride_status(ride_id, "in_progress")


@app.route("/ride/<int:ride_id>/complete", methods=["POST"])
def complete(ride_id):
    return update_ride_status(ride_id, "completed")


@app.route("/ride/<int:ride_id>/pay", methods=["POST"])
def pay(ride_id):
    return update_ride_status(ride_id, "paid")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
