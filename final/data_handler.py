import pandas as pd
import sys
from colorama import Fore, Style, init
from sqlalchemy import create_engine
import urllib.parse

init(autoreset=True) # Initialize Colorama

# MySQL connection details
MYSQL_USER = 'root'
MYSQL_PASSWORD = urllib.parse.quote_plus('Myna@123')
MYSQL_HOST = 'localhost'
MYSQL_PORT = 3306
MYSQL_DB = 'employee_training'

# SQLAlchemy connection string
CONN_STR = f"mysql+pymysql://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}:{MYSQL_PORT}/{MYSQL_DB}"
engine = create_engine(CONN_STR)

def load_data():
    """
    Loads employee, course, assessment, and credential data from the MySQL database.
    Exits if the connection or query fails.
    """
    try:
        df_employees = pd.read_sql_table('employee_details', engine)
        df_courses = pd.read_sql_table('course_details', engine)
        df_assessments = pd.read_sql_table('employee_training_datasets', engine)
        df_credentials = pd.read_sql_table('credentials', engine)
        return df_employees, df_courses, df_assessments, df_credentials
    except Exception as e:
        print(Fore.RED + f"Error loading data from MySQL: {e}")
        sys.exit()

def save_credentials(df_credentials):
    """
    Saves the updated credentials DataFrame back to the MySQL Credentials table.
    This will REPLACE all data in the Credentials table with the DataFrame contents.
    """
    try:
        df_credentials.to_sql('Credentials', engine, if_exists='replace', index=False)
        return True
    except Exception as e:
        print(Fore.RED + f"\nError saving credentials to MySQL. Details: {e}")
        return False

# Load data immediately when the module is imported
df_employees, df_courses, df_assessments, df_credentials = load_data()