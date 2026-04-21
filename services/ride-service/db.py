import psycopg2

def get_connection():
    return psycopg2.connect(
        dbname="ride_db",
        user="sre_user",
        password="sre_password",
        host="localhost",
        port="5432"
    )
