from sqlalchemy.orm import declarative_base

DATABASE_URL = "postgresql+psycopg://localhost:5432/mydatabase"

Base = declarative_base()
