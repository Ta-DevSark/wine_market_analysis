import sqlite3 as sq3
import streamlit as st

# Set page config and title
st.set_page_config(page_title="Vivino Wine Data", layout="wide")

# Connect to the database
conn = sq3.connect('vivino.db')

# Create a cursor object to execute SQL queries
cursor = conn.cursor()

# Read SQL files and execute the queries
sql_files = [
    'queries/best_winery.sql',
    'queries/list10.sql',
    'queries/marketing.sql',
    'queries/taste_keywords.sql',
    'queries/top3.sql',
    'queries/vintage_leaderboard.sql',
    'queries/wine_leaderboard.sql'
]

# Function to run SQL file and return the result as a list of tuples
def run_sql_file(file, cursor):
    with open(file, 'r') as sql_file:
        sql_query = sql_file.read()
        cursor.execute(sql_query)
        result = cursor.fetchall()
        return result
    
# Function to convert the result to a table
def convert_to_table(result, cursor):
    column_names = [description[0] for description in cursor.description]
    table = []
    table.append(column_names)
    table.extend(result)
    return table

# Display the tables for each SQL file
for file in sql_files:
    st.write(f"Results for {file[8:-4]}")
    result = run_sql_file(file, cursor)
    table = convert_to_table(result, cursor)
    st.table(table)

# Close the connection
conn.close()
