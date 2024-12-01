from sqlalchemy import create_engine, select
from sqlalchemy.orm import sessionmaker

from user import User
from base import DATABASE_URL

def main():
    print("Updating...")

    engine = create_engine(DATABASE_URL)

    Session = sessionmaker(bind=engine)
    session = Session()

    stmt = select(User).filter_by(email="algogrit@gmail.com")

    user = session.execute(stmt).scalar_one()

    user.name = "G A"

    # Commit session!
    session.commit()

if __name__ == '__main__':
    main()
