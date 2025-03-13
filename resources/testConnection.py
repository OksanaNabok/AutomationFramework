import pyodbc

# Connection string
connection_string = (
    "DRIVER={ODBC Driver 17 for SQL Server}; "
    "SERVER=localhost,1433; "
    "DATABASE=AdventureWorks2012; "
    "UID=RobotTestUser1; "
    "PWD=testPass;"
)

try:
    # Connect to the database
    conn = pyodbc.connect(connection_string)
    print("Connection successful!")

    # Create a cursor
    cursor = conn.cursor()

    # SQL Query
    query = "SELECT TOP 10 AddressID, AddressLine1, AddressLine2, City, StateProvinceID, PostalCode FROM Person.Address;"  # Example query to fetch first 10 records
    cursor.execute(query)

    # Fetch and print the results
    rows = cursor.fetchall()
    for row in rows:
        print(row)

except Exception as e:
    print(f"Connection failed: {e}")

finally:
    # Always close the cursor and connection
    if 'cursor' in locals():
        cursor.close()
    if 'conn' in locals():
        conn.close()