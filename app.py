import sqlite3 as sq3
import streamlit as st
import pandas as pd
from st_aggrid import GridOptionsBuilder, AgGrid
from st_aggrid.grid_options_builder import GridOptionsBuilder

# Set page config and title
st.set_page_config(page_title="Wiwino", page_icon=":wine_glass:", layout="wide")

# Connect to the database
conn = sq3.connect('vivino.db')
# Create a cursor object to execute SQL queries
cursor = conn.cursor()

# Use local CSS
def local_css(file_name):
    with open(file_name) as f:
        st.markdown(f"<style>{f.read()}</style>", unsafe_allow_html=True)
local_css("style/style.css")

# ---- HEADER SECTION ----
with st.container():
    st.title("Welcome to Wiwino :wine_glass:")
    st.subheader("Great data on the greatest wines")

# Read SQL files and execute the queries
sql_files = [
    'queries/best_winery.sql',
    'queries/list10.sql',
    'queries/marketing.sql',
    'queries/flavor_count.sql',
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

data= pd.read_csv('queries/taste_keyw.csv', index_col=0)

gb = GridOptionsBuilder.from_dataframe(data)
gb.configure_pagination(paginationAutoPageSize=True) #Add pagination
gb.configure_side_bar() #Add a sidebar
gb.configure_selection('multiple', use_checkbox=True, groupSelectsChildren="Group checkbox select children") #Enable multi-row selection
gridOptions = gb.build()

grid_response = AgGrid(
    data,
    gridOptions=gridOptions,
    data_return_mode='AS_INPUT', 
    update_mode='MODEL_CHANGED', 
    fit_columns_on_grid_load=False,
    enable_enterprise_modules=True,
    height=350, 
    width='100%',
    reload_data=True
)

data = grid_response['data']
selected = grid_response['selected_rows'] 
df = pd.DataFrame(selected) #Pass the selected rows to a new dataframe df

# ---- CONTACT ----
with st.container():
    st.write("---")
    st.header("Suggestions ? Contact us !")
    st.write("##")

    contact_form = """
    <form action="https://formsubmit.co/YOUR@MAIL.COM" method="POST">
        <input type="hidden" name="_captcha" value="false">
        <input type="text" name="name" placeholder="Your name" required>
        <input type="email" name="email" placeholder="Your email" required>
        <textarea name="message" placeholder="Your message here" required></textarea>
        <button type="submit">Send</button>
    </form>
    """
    left_column, right_column = st.columns(2)
    with left_column:
        st.markdown(contact_form, unsafe_allow_html=True)
    with right_column:
        st.empty()

# Close the connection
conn.close()
