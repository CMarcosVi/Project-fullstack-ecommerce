import mysql.connector
from dotenv import load_dotenv
import os

# Carrega variáveis de ambiente do arquivo .env
load_dotenv()

# Recupera variáveis de ambiente
db_user = os.getenv('DB_USER')
db_pass = os.getenv('DB_PASS')
database = os.getenv('DATABASE')
connection = mysql.connector.connect(
    host='localhost',
    user=db_user,
    password=db_pass,
    database=database
)