import psycopg

# Connect to the database
# conn = psycopg.connect("dbname=mydatabase user=gaurav")

conn = psycopg.connect("postgresql://localhost:5432/mydatabase")

# conn = psycopg.create_engine("postgresql://localhost:5432/mydatabase")

# Create a cursor to execute queries - explicitly
# cur = conn.cursor()
# cur.execute("SELECT * FROM person")

# Execute a query - or implicitly
cur = conn.execute("SELECT * FROM person")

# Fetch results
rows = cur.fetchall()
for row in rows:
    print(row)

# Close the cursor and connection
cur.close()
conn.close()
