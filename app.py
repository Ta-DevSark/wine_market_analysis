import sqlite3 as sq3
import pandas as pd
import streamlit as st
import matplotlib as plt

conn = sq3.connect('vivino.db')

st.write("""
# Vivino, great data on the greatest wines

It's all about wine !

""")

# Create a database connection
conn = sq3.connect('vivino.db')

# Create a cursor object to execute SQL queries
cursor = conn.cursor()

# Read SQL files and execute the queries
sql_files = ['queries/best_winery.sql', 
             'queries/list10.sql', 
             'queries/marketing.sql',
             'queries/taste_keywords.sql',
             'queries/top3.sql',
             'queries/vintage_leaderboard.sql',
             'queries/wine_leaderboard.sql',
             'queries/price.sql']

# Function to run SQL file and return the result as a DataFrame
def run_sql_file(file, cursor):
    with open(file, 'r') as sql_file:
        sql_query = sql_file.read()
        cursor.execute(sql_query)
        result = cursor.fetchall()
        column_names = [description[0] for description in cursor.description]
        df = pd.DataFrame(result, columns=column_names)
        return df

# Display the tables for each SQL file
for file in sql_files:
    st.write(f"## Results for {file[8:-4]}")
    df = run_sql_file(file, cursor)
    st.dataframe(df)

# Close the connection
conn.close()
