from sqlalchemy import create_engine, select
from sqlalchemy.orm import sessionmaker

from user import User
from base import DATABASE_URL

def main():
    print("Selecting...")

    engine = create_engine(
        DATABASE_URL,
        pool_size=10,             # Maximum number of connections in the pool
        max_overflow=5,           # Number of additional connections allowed beyond `pool_size`
        pool_timeout=30,          # Maximum time (in seconds) to wait for a connection
        pool_recycle=1800,        # Time (in seconds) to recycle a connection
        pool_pre_ping=True        # Check connections before using them
    )

    Session = sessionmaker(bind=engine)
    session = Session()

    # Query ## 1.x style
    # users = session.query(User).all()
    # for user in users:
    #     print(user)

    # Query ## 2.x style
    users = session.scalars(
        select(User)
    ).all()

    for user in users:
        print(user)

    # Commit session!
    session.commit()

if __name__ == '__main__':
    main()
