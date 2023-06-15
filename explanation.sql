/* 
# Function to run SQL file and return the result as a DataFrame
def run_sql_file(file, cursor):
    with open(file, 'r') as sql_file:
        sql_query = sql_file.read()
        cursor.execute(sql_query)
        result = cursor.fetchall()
        column_names = [description[0] for description in cursor.description]
        df = pd.DataFrame(result, columns=column_names)
        return df
*/

/*markdown
The code defines a function named run_sql_file that takes two parameters: file (the path to the SQL file) and cursor (the database cursor used to execute the SQL queries).
*/

/*markdown
Inside the function, the SQL file is opened using a with statement, which ensures that the file is properly closed after reading.
*/

/*markdown
The contents of the SQL file are read and stored in the sql_query variable.
*/

/*markdown
The execute method of the cursor object is called with the sql_query as the argument. This executes the SQL query contained in the file.
*/

/*markdown
The fetchall method is called on the cursor to retrieve all the rows returned by the query. The result is stored in the result variable.
*/

/*markdown
The cursor.description attribute returns information about the columns in the result set. The list comprehension [description[0] for description in cursor.description] extracts the column names and stores them in the column_names variable.
*/

/*markdown
Using the pd.DataFrame constructor from the pandas library, a DataFrame is created from the result and column_names variables. The resulting DataFrame is stored in the df variable.
*/

/*markdown
Finally, the function returns the DataFrame df as the result.
*/

/*
# Display the tables for each SQL file
for file in sql_files:
    st.write(f"## Results for {file}")
    df = run_sql_file(file, cursor)
    st.dataframe(df)
*/

/*markdown
This part of the code assumes there is a list named sql_files that contains the paths to the SQL files to be executed.
*/

/*markdown
It loops over each file in the sql_files list.
*/

/*markdown
For each file, it uses the st.write function (presumably from a Streamlit library) to display a section header indicating the current file being executed.
*/

/*markdown
The run_sql_file function is called with the current file and cursor as arguments, and the returned DataFrame is assigned to the df variable.
*/

/*markdown
The st.dataframe function is used to display the DataFrame df in a tabular format.
*/

/*markdown
In summary, the code defines a function run_sql_file that reads an SQL file, executes the query, retrieves the result, and returns it as a DataFrame. It then uses this function to execute multiple SQL files and display the results in a tabular format using Streamlit.
*/