from sqlalchemy import text

# Define the raw SQL query
raw_query = text("SELECT id, name, age FROM users WHERE age > :age")

# Execute the query and map results directly to User
users = session.execute(raw_query, {"age": 30}).scalars().all()

# Access mapped objects directly
for user in users:
    print(f"ID: {user.id}, Name: {user.name}, Age: {user.age}")
