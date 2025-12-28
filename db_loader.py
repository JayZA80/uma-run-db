import json
import mysql.connector
from mysql.connector import Error
from dotenv import load_dotenv
import os

load_dotenv()
host = os.getenv("MYSQL_HOST")
user = os.getenv('MYSQL_USER')
password = os.getenv("MYSQL_PASSWORD")
database = os.getenv("MYSQL_DB")

try:
    # Create a connection
    connection = mysql.connector.connect(
        host=host,      # or your server IP
        user=user,           # your MySQL username
        password=password,           # your MySQL password
        database=database  # optional, can connect without specifying
    )

    if connection.is_connected():
        print("Connected to MySQL database")

        # Create a cursor to execute queries
        cursor = connection.cursor()

        # Get scraped data
        try:
            with open("data.json", "r", encoding="utf-8") as f:
                data = []
                for item in json.load(f):
                    data.append((item["name"], item["desc"]))
                sql_script = """
                INSERT INTO skills (skill_name, skill_desc)
                VALUES (%s, %s)
                """
                cursor.executemany(sql_script, data)
                connection.commit()
                
        except FileNotFoundError:
            print("Error: The file 'data.json' was not found.")

        except json.JSONDecodeError as e:
            print(f"Failed to decode JSON: {e}")

        except UnicodeDecodeError as e:
            print(f"Failed to read file due to encoding: {e}")

        except Error as e:
            print("Error while connecting to MySQL:", e)

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection closed")
