from sqlalchemy.orm import aliased
from sqlalchemy import text

# Execute raw SQL query
raw_query = text("SELECT id, name, age FROM users WHERE age > :age")
results = session.execute(raw_query, {"age": 30})

# Map results to User objects
mapped_users = [User(id=row.id, name=row.name, age=row.age) for row in results]

# Access mapped objects
for user in mapped_users:
    print(f"ID: {user.id}, Name: {user.name}, Age: {user.age}")
