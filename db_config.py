import psycopg2

def get_db_connection():
    return psycopg2.connect(
        host="localhost",
        database="cafeteria",
        user="postgres",
        password="12345"
    )
