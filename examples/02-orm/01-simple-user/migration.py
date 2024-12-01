from query import DATABASE_URL
from sqlalchemy import create_engine

from base import Base, DATABASE_URL

def main():
    print("Running migrations...")
    engine = create_engine(DATABASE_URL)

    Base.metadata.create_all(engine)

if __name__ == '__main__':
    main()
