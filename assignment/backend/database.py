import os
import psycopg2
from psycopg2 import sql

# This correctly fetches the environment variable named "DATABASE_URL"
DATABASE_URL = os.getenv("DATABASE_URL")

def get_db_connection():
    return psycopg2.connect(DATABASE_URL)

