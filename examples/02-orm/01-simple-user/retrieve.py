from sqlalchemy import create_engine, select
from sqlalchemy.orm import sessionmaker

from user import User
from base import DATABASE_URL

def main():
    print("Selecting...")

    engine = create_engine(DATABASE_URL)

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
