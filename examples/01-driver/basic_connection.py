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
# cur = conn.execute("SELECT * FROM person WHERE id = %s", (1,)) # -- Tuple
# cur = conn.execute("SELECT * FROM person WHERE id = %s", [1]) # -- Array
# cur = conn.execute("SELECT * FROM person WHERE id = %(id)s", {'id': 1}) # -- Dictionary with string keys

# Fetch one result
row = cur.fetchone()
print(row)

# Fetch all results
# rows = cur.fetchall()
# for row in rows:
#     # print("Name:", row[0], "| Age:", row[1])
#     # print(row[1] + 1)
#     print(row)

# Close the cursor and connection
cur.close()
conn.close()
