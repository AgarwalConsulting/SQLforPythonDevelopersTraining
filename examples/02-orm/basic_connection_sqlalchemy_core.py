from sqlalchemy import create_engine, text

# Replace with your database URL
DATABASE_URL = "postgresql+psycopg://localhost/mydatabase"

# Create an engine
engine = create_engine(DATABASE_URL)

# Test the connection
with engine.connect() as connection:
    result = connection.execute(text("SELECT * FROM person"))
    print(result.fetchone())
