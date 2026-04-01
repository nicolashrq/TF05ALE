import mysql.connector

def check():
    try:
        conn = mysql.connector.connect(
            host="db",
            user="user",
            password="pass",
            database="app"
        )
        return True
    except:
        return False